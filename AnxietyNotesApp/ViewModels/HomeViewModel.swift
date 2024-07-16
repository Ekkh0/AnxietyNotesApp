//
//  HomeViewModel.swift
//  AnxietyNotesApp
//
//  Created by Anggara Satya Wimala Nelwan on 13/07/24.
//

import Foundation
import SwiftUI

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
        }
        
        func fetchNotes(){
            notes = dataSource.fetchNotes()
        }
        
        func getMonth(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            return dateFormatter.string(from: date)
        }
        
        func deleteNote(note: Note){
            dataSource.deleteNote(note: note)
        }
    }
}
