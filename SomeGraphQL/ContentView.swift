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

    @State var repos: String = ""

    var body: some View {
        VStack {
            Text("Repos \(repos)")
                .padding()
            HStack {
                Button("star") {
                    Network
                        .shared
                        .addStar()
                        .sink { (completion) in
                            print(completion)
                        } receiveValue: { (value) in
                            repos = "fav \(value.id) \(value.nameWithOwner) \(value.viewerHasStarred)"

                        }.store(in: &cancellables)

                }
                Button("unstar") {
                    Network
                        .shared
                        .removeStar()
                        .sink { (completion) in
                            print(completion)
                        } receiveValue: { (value) in
                            repos = "unfav \(value.id) \(value.nameWithOwner) \(value.viewerHasStarred)"

                        }.store(in: &cancellables)
                }
            }
        }
        .onAppear(perform: {
            Network
                .shared
                .fetchRepos(Const.thisRepoName)
                .sink { (completion) in
                    print(completion)
                } receiveValue: { (value) in
                    print(value)
                    repos = "ok \(value.id) \(value.nameWithOwner) \(value.viewerHasStarred)"
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
