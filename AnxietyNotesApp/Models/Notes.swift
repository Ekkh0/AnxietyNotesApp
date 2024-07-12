//
//  Notes.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 09/07/24.
//

import Foundation

struct Note{
    var title: String?
    var content: String?
    var date: Date
    var sumEmotion: String?
}

struct Notes{
    var notes: [Note]
}

var testNote = [
    Note(title: "Ini test", content: "blabalblablalbalblablalblablalbalblalbalbalblablalbalbalblablalbalblablalbalblablalbalblalba lbalblablalbalbla blalbalblablalbalblal", date: Date.now, sumEmotion: "Sad"),
    Note(title: "Ini test kedua", content: "blabalblablalbalblablalblablalbalblalbalbalblablalbalbalblablalbalblablalbalblablalbalblalba lbalblablalbalbla blalbalblablalbalblal", date: Date.now, sumEmotion: "Sad"),
    ]
