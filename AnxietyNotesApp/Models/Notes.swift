//
//  Notes.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 09/07/24.
//

import Foundation
import SwiftData

@Model
class Note{
    var id: UUID = UUID()
    var title: String?
    var content: String?
    var date: Date = Date.now
    var sumEmotion: String?
    
    init(title: String? = nil, content: String? = nil, date: Date, sumEmotion: String? = nil) {
        self.title = title
        self.content = content
        self.sumEmotion = sumEmotion
    }
}


