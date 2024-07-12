//
//  Feelings.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 09/07/24.
//

import Foundation
import SwiftUI

enum Feelings: String{
    case neutral, happy, sad, fear, anger
    
    var feelingColor: [Color] {
        switch self{
        case .neutral:
            return [.white, .white]
        case .happy:
            return [.yellow, .white]
        case .sad:
            return [.blue, .white]
        case .fear:
            return [.purple, .white]
        case .anger:
            return [.red, .white]
        }
    }
    
    init?(label: String?) {
        switch label?.lowercased() {
        case "neutral":
            self = .neutral
        case "joy":
            self = .happy
        case "sad", "sadness":
            self = .sad
        case "fear":
            self = .fear
        case "anger":
            self = .anger
        default:
            return nil
        }
    }
}
