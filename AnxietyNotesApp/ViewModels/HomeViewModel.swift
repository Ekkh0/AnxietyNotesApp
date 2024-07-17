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
        var selectedEmotion = "Anger"{
            didSet {
                fetchNotesByEmotion()
            }
        }
        var searchText = ""
        var searchIsActive = false
        
        var selectedSorting = "Latest" // Add this property to store the selected sorting option
                
        
        private init(dataSource: SwiftDataService){
            self.dataSource = dataSource
            fetchNotes()
//            fetchNotesByEmotion()
        }
        
//        private init(dataSourceSorted : SwiftDataService){
//            self.dataSource = dataSourceSorted
//            fetchNotesByEmotion()
//        }
        
        func fetchNotes(){
            notes = dataSource.fetchNotes()
        }
        
        func fetchNotesByEmotion(){
            print("Called")
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
