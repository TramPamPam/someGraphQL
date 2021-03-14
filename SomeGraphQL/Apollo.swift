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

    func fetchNativeAndEmoji(completion: @escaping ((CountryModel?) -> Void)) {
        apollo.fetch(query: UkraineQuery()) { result in
            switch (result) {
            case .success(let value):
                let name = value.data?.country?.native ?? ""
                let emoji = value.data?.country?.emoji ?? ""
                completion(CountryModel(nameNative: name, emoji: emoji))
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }

}
