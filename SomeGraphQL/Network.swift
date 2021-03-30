//
//  Apollo.swift
//  SomeGraphQL
//
//  Created by Oleksandr on 13.03.2021.
//

import Foundation
import Apollo
import Combine

final class Network {
    static let shared = Network()

    private init() {}

    private(set) lazy var apollo: ApolloClient = {
        // The cache is necessary to set up the store, which we're going to hand to the provider
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)

        let client = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: client)
        let url = URL(string: "https://api.github.com/graphql")!

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)


        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }()

    func fetchRepos(_ searchText: String) -> Future<RepositoryDetail, Error> {
        Future() { promise in
            self.apollo.fetch(query: SearchReposQuery(searchText: searchText)) { result in
                switch (result) {
                case .success(let value):
                    let repositoryDetails = (value.data?.search.nodes ?? [SearchReposQuery.Data.Search.Node?]())
                        .compactMap{ $0?.asRepository }
                        .compactMap{ $0?.fragments.repositoryDetail }

                    if let first = repositoryDetails.first {
                        return promise(.success(first))
                    }
                    return promise(.failure(CustomError.unexpected))

                case .failure(let error):
                    print(error)
                    return promise(.failure(error))
                }
            }
        }
    }

    func addStar(_ repositoryID: String = Const.thisRepoID) -> Future<RepositoryDetail, Error> {
        Future() { promise in
            self.apollo.perform(mutation: AddStarMutation(repositoryId: repositoryID)) { result in
                switch result {
                case .success(let res):
                    if let repo =  res.data?.addStar?.starrable?.asRepository?.fragments.repositoryDetail {
                        return promise(.success(repo))
                    }
                    return promise(.failure(CustomError.unexpected))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }
    }

    func removeStar(_ repositoryID: String = Const.thisRepoID) -> Future<RepositoryDetail, Error> {
        Future() { promise in
            self.apollo.perform(mutation: RemoveStarMutation(repositoryId: repositoryID)) { result in
                switch result {
                case .success(let res):
                    if let repo =  res.data?.removeStar?.starrable?.asRepository?.fragments.repositoryDetail {
                        return promise(.success(repo))
                    }
                    return promise(.failure(CustomError.unexpected))
                case .failure(let error):
                    return promise(.failure(error))
                }
            }
        }
    }
}

enum CustomError: Error {
    case unexpected
}
