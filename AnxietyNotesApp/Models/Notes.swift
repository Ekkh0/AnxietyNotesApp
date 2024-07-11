//
//  Notes.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 09/07/24.
//

import Foundation

struct Notes{
    var title: String
    var content: String
    var date: Date
    var sumEmotion: String
}

var testNote = [
    Notes(title: "Ini test", content: "blabalblablalbalblablalblablalbalblalbalbalblablalbalbalblablalbalblablalbalblablalbalblalba lbalblablalbalbla blalbalblablalbalblal", date: Date.now, sumEmotion: "Sad"),
    Notes(title: "Ini test kedua", content: "blabalblablalbalblablalblablalbalblalbalbalblablalbalbalblablalbalblablalbalblablalbalblalba lbalblablalbalbla blalbalblablalbalblal", date: Date.now, sumEmotion: "Sad"),
    ]
