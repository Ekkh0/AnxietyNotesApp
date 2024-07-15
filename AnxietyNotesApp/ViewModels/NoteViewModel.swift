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
        
        var feeling: String? = ""
        var text: String = ""
        var title: String = ""
        
        let indoModel = try? NLModel(mlModel: SentenceEmoIndo(configuration: MLModelConfiguration()).model)
        let engModel = try? NLModel(mlModel: SentenceEmoEnglish(configuration: MLModelConfiguration()).model)
        
        init(datasource: SwiftDataService){
            self.datasource = datasource
        }
        
        func currentDateString() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d"
            return dateFormatter.string(from: Date())
        }
        
        func saveNote(){
            let note = Note(title: title, content: text, date: Date.now, sumEmotion: indoModel?.predictedLabel(for: text))
            datasource.saveNotes(note: note)
            WidgetCenter.shared.reloadTimelines(ofKind: "NewNoteWidget")
        }
    }
}
