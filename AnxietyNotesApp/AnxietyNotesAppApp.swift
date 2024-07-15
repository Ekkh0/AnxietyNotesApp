//
//  AnxietyNotesAppApp.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 08/07/24.
//

import SwiftUI

@main
struct AnxietyNotesAppApp: App {
    @ObservedObject var router = Router()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                HomeView()
                    .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                        case .home:
                            HomeView()
                        case .newNote:
                            NoteView()
                        }
                    }
            }
            .environmentObject(router)
            .onOpenURL(perform: { url in
                if url.host() == "newNote"{
                    router.navigate(to: .newNote)
                }
            })
        }
    }
}
