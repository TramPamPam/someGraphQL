//
//  ContentView.swift
//  SomeGraphQL
//
//  Created by Oleksandr on 13.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State var countryNativeName = ""

    @State var countryEmoji = ""

    var body: some View {
        Text("Hello from \(countryNativeName) (\(countryEmoji))!")
            .padding().onAppear(perform: {
                Network.shared.fetchNativeAndEmoji { (data) in
                    if let result = data?.country {
                        countryEmoji = result.emoji
                        countryNativeName = result.native
                    }
                }
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
