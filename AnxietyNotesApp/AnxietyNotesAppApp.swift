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
                        case .homeView:
                            HomeView()
                        case .noteView(let noteID):
                            if let noteID = noteID{
                                let note = SwiftDataService.shared.fetchNoteById(id: noteID)
                                NoteView(note: note)
                            } else {
                                NoteView()
                            }
                        case .saveNoteView(let feeling):
                            SaveNoteView(feeling: feeling)
                        }
                    }
            }
            .environmentObject(router)
            .onOpenURL(perform: { url in
                if url.host() == "newNote"{
                    if let components = URLComponents(url: url, resolvingAgainstBaseURL: true){
                        var parameters: [String: String] = [:]
                        for queryItem in components.queryItems ?? [] {
                            parameters[queryItem.name] = queryItem.value
                        }
                        if let stringID = parameters["noteID"], let noteID = UUID(uuidString: stringID){
                            router.navigate(to: .noteView(noteID: noteID))
                        }else{
                            router.navigate(to: .noteView(noteID: nil))
                        }
                    }
                }
            })
        }
    }
}
