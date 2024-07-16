//
//  ContentViewModel.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 11/07/24.
//

import Foundation
import CoreML
import NaturalLanguage
import WidgetKit

extension NoteView{
    @Observable
    class ViewModel{
        private let datasource: SwiftDataService
        
        var note: Note?
        var feeling: String? = ""
        var text: String = ""
        var title: String = ""
        var navigateToSaveNote = false
        
        let indoModel = try? NLModel(mlModel: SentenceEmoIndo(configuration: MLModelConfiguration()).model)
        let engModel = try? NLModel(mlModel: SentenceEmoEnglish(configuration: MLModelConfiguration()).model)
        
        init(datasource: SwiftDataService, note: Note?){
            self.datasource = datasource
            if let note = note{
                self.note = note
                self.text = note.content!
                self.feeling = note.sumEmotion
                self.title = note.title!
            }
        }
        
        func currentDateString() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d"
            return dateFormatter.string(from: Date())
        }
        
        func saveNote(){
            if let note = note{
                note.title = title
                note.content = text
                note.sumEmotion = indoModel?.predictedLabel(for: text)
                note.date = Date.now
                datasource.saveContext()
            }else{
                let newNote = Note(title: title, content: text, date: Date.now, sumEmotion: indoModel?.predictedLabel(for: text))
                datasource.saveNotes(note: newNote)
            }
            
            WidgetCenter.shared.reloadTimelines(ofKind: "NewNoteWidget")
        }
    }
}
