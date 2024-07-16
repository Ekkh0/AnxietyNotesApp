//
//  SwiftDataSevice.swift
//  AnxietyNotesApp
//
//  Created by Anggara Satya Wimala Nelwan on 12/07/24.
//

import Foundation
import SwiftData

class SwiftDataService{
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Note.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    func fetchNotes() -> [Note] {
        var fetchDescriptor = FetchDescriptor<Note>()
        fetchDescriptor.sortBy = [SortDescriptor(\Note.date, order: .reverse)]
        
        do {
            return try modelContext.fetch(fetchDescriptor)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    func fetchNotesForCurrentWeek() -> [Note?] {
        let calendar = Calendar.current
        let now = Date()
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: now)?.start ?? now
        
        var fetchDescriptor = FetchDescriptor<Note>()
        fetchDescriptor.predicate = #Predicate { note in
            note.date >= startOfWeek
        }
        fetchDescriptor.sortBy = [SortDescriptor(\Note.date, order: .reverse)]
        
        do {
            let notes = try modelContext.fetch(fetchDescriptor)
            
            var weekNotes = [Note?](repeating: nil, count: 7)
            
            for note in notes {
                let weekDay = calendar.component(.weekday, from: note.date)
                // Adjusting index for Monday as the first day of the week (1 = Sunday, 2 = Monday, ..., 7 = Saturday)
                let relativeIndex = (weekDay + 5) % 7
                if weekNotes[relativeIndex] == nil {
                    weekNotes[relativeIndex] = note
                }
            }
            
            return weekNotes
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
    func saveNotes(note: Note){
        modelContext.insert(note)
    }
    
    func saveContext() {
        do {
            try modelContext.save()
        } catch {
            fatalError("Failed to update note: \(error.localizedDescription)")
        }
    }
    
    func fetchNoteById(id: UUID) -> Note? {
        var fetchDescriptor = FetchDescriptor<Note>()
        fetchDescriptor.predicate = #Predicate { note in
            note.id == id
        }
        
        do {
            return try modelContext.fetch(fetchDescriptor).first
        } catch {
            fatalError("Failed to fetch note by id: \(error.localizedDescription)")
        }
    }
}
