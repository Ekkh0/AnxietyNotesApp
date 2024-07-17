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
        var feeling: String? = "Neutral"
        var text: String = ""
        var title: String = ""
        var navigateToSaveNote = false
        
        var emoModel : NLModel?{
            let language = UserDefaults.standard.object(forKey: "AppleLanguages") as? [String]
            if let language = language, language.first == "id"{
                print("model dalam bahasa indonesia")
                return try? NLModel(mlModel: SentenceEmoEnglish(configuration: MLModelConfiguration()).model)
            }else{
                print("model dalam bahasa inggris")
                return try? NLModel(mlModel: SentenceEmoIndo(configuration: MLModelConfiguration()).model)
            }
        }
        
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
        
        func getDateString(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d"
            return dateFormatter.string(from: date)
        }
        
        func saveNote(){
            if let note = note{
                note.title = title
                note.content = text
                note.sumEmotion = emoModel?.predictedLabel(for: text)
                note.date = Date.now
                datasource.saveContext()
            }else{
                text.last != "." ? text.append(".") : nil
                if title.isEmpty{
                    title = text.firstSentence()!
                }
                let newNote = Note(title: title, content: text, date: Date.now, sumEmotion: emoModel?.predictedLabel(for: text))
                datasource.saveNotes(note: newNote)
            }
            
            WidgetCenter.shared.reloadTimelines(ofKind: "NewNoteWidget")
        }
    }
}
