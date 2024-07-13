//
//  HomeViewModel.swift
//  AnxietyNotesApp
//
//  Created by Anggara Satya Wimala Nelwan on 13/07/24.
//

import Foundation

extension HomeView{
    
   @Observable
    class ViewModel{
        static let shared: ViewModel = ViewModel(dataSource: .shared)
        private let dataSource: SwiftDataService
        var notes: [Note] = []
        var showingPopover = false
        var isDataChanged = false
        
        private init(dataSource: SwiftDataService){
            self.dataSource = dataSource
            fetchNotes()
            print(notes.count)
        }
        
        func fetchNotes(){
            notes = dataSource.fetchNotes()
        }
        
    }
}
