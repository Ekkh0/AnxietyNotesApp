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
        var feeling: String? = "happy"
        var bgColor: Color? = Color.white
        var text: String = ""
        
        let indoModel = try? NLModel(mlModel: SentenceEmoIndo(configuration: MLModelConfiguration()).model)
        let engModel = try? NLModel(mlModel: SentenceEmoEnglish(configuration: MLModelConfiguration()).model)
    }
}
