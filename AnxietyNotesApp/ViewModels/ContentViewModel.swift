//
//  ContentViewModel.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 11/07/24.
//

import Foundation
import CoreML
import NaturalLanguage
import SwiftUI

extension ContentView{
    @Observable
    class ViewModel{
        var feeling: String? = ""
        var text: String = ""
        var title: String = ""
        var notes: [Note] = []
        
        let indoModel = try? NLModel(mlModel: SentenceEmoIndo(configuration: MLModelConfiguration()).model)
        let engModel = try? NLModel(mlModel: SentenceEmoEnglish(configuration: MLModelConfiguration()).model)
        
        func currentDateString() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMM d"
            return dateFormatter.string(from: Date())
        }
        
        func saveNote(){
            var note = Note(title: title, content: text, date: Date.now, sumEmotion: indoModel?.predictedLabel(for: text))
            notes.append(note)
        }
    }
}
