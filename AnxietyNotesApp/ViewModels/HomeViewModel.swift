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
        var selectedEmotion = "All"{
            didSet {
                fetchNotesByEmotion()
            }
        }
        var searchText = ""
        var searchIsActive = false
                
        
        private init(dataSource: SwiftDataService){
            self.dataSource = dataSource
            fetchNotesByEmotion()
        }
        
        func fetchNotes(){
            notes = dataSource.fetchNotes()
        }
        
        func fetchNotesByEmotion(){
            notes = dataSource.fetchNotesByEmotion(emotion: selectedEmotion)
        }
        
        func getMonth(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM"
            return dateFormatter.string(from: date)
        }
        
        func deleteNote(note: Note){
            dataSource.deleteNote(note: note)
        }
        
        func searchNote(){
            fetchNotes()
            if searchText != ""{
                notes = notes.filter{($0.content?.lowercased().contains(searchText.lowercased())) ?? false || ($0.title?.lowercased().contains(searchText.lowercased())) ?? false}
            }
        }
    }
}
