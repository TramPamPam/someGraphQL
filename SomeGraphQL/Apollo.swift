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

    private let url = URL(string: "https://countries.trevorblades.com/")!

    private lazy var apollo = ApolloClient(url: url)

    func fetchNativeAndEmoji() -> Future<CountryModel, Error> {
        return Future() { promise in
            self.apollo.fetch(query: UkraineQuery()) { result in
                switch (result) {
                case .success(let value):
                    let name = value.data?.country?.native ?? ""
                    let emoji = value.data?.country?.emoji ?? ""
                    return promise(
                        .success(
                            .init(nameNative: name, emoji: emoji)
                        )
                    )

                case .failure(let error):
                    print(error)
                    return promise(.failure(error))
                }
            }
        }
    }

}
