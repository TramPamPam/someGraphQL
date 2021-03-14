//
//  CountryPublisher.swift
//  SomeGraphQL
//
//  Created by Oleksandr on 14.03.2021.
//

import Foundation
import Combine

struct CountryPublisher: Publisher {

    typealias Output = CountryModel

    typealias Failure = Never

    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
        Network.shared.fetchNativeAndEmoji { (model) in
            guard let result = model else {
                return
            }
            _ = subscriber.receive(result)
        }
    }

}
