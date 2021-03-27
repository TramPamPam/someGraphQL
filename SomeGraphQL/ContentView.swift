//
//  ContentView.swift
//  SomeGraphQL
//
//  Created by Oleksandr on 13.03.2021.
//

import SwiftUI
import Combine

//??
var cancellables: Set<AnyCancellable> = []

struct ContentView: View {

    @State var model: CountryModel = .empty

    var body: some View {
        Text("Hello from \(model.nameNative) (\(model.emoji))!")
            .padding()
            .onAppear(perform: {
                Network
                    .shared
                    .fetchNativeAndEmoji()
                    .sink { (completion) in
                        print(completion)
                    } receiveValue: { (country) in
                        print(country)
                        model = country
                    }
                    .store(in: &cancellables)
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
