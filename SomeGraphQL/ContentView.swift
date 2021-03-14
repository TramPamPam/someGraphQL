//
//  ContentView.swift
//  SomeGraphQL
//
//  Created by Oleksandr on 13.03.2021.
//

import SwiftUI
import Combine

struct ContentView: View {
    let publisher = CountryPublisher()

    @State var model: CountryModel = .empty

    var body: some View {
        Text("Hello from \(model.nameNative) (\(model.emoji))!")
            .padding()
            .onAppear(perform: {
                publisher.receive(subscriber: self)
            })
    }
}

extension ContentView: Subscriber {

    typealias Input = CountryModel

    typealias Failure = Never

    var combineIdentifier: CombineIdentifier {
        CombineIdentifier()
    }

    func receive(subscription: Subscription) {
        print(#function)
    }

    func receive(_ input: CountryModel) -> Subscribers.Demand {
        model = input
        return Subscribers.Demand.unlimited
    }

    func receive(completion: Subscribers.Completion<Never>) {
        print(#function)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
