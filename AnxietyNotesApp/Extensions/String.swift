//
//  String.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 11/07/24.
//

import Foundation

extension String {
    func lastSentence() -> String? {
        // Split the string by dots and newlines
        let sentences = self.components(separatedBy: [".", "\n"]).filter { !$0.isEmpty }
        
        // Get the last non-empty sentence
        return sentences.last?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func firstSentence() -> String? {
        // Split the string by dots and newlines
        let sentences = self.components(separatedBy: [".", "\n"]).filter { !$0.isEmpty }
        
        // Get the last non-empty sentence
        return sentences.first?.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
