//
//  Apollo.swift
//  SomeGraphQL
//
//  Created by Oleksandr on 13.03.2021.
//

import Foundation
import Apollo

final class Network {
    static let shared = Network()

    private init() {}

    private let url = URL(string: "https://countries.trevorblades.com/")!

    private lazy var apollo = ApolloClient(url: url)

    func fetchNativeAndEmoji(completion: @escaping ((UkraineQuery.Data?) -> Void)) {
        apollo.fetch(query: UkraineQuery()) { result in
            switch (result) {
            case .success(let value):
                completion(value.data)
            case .failure(_):
                completion(nil)
            }
        }
    }

}
