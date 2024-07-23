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
            return [.neutral1, .neutral2]
        case .happy:
            return [.happy1, .happy2]
        case .sad:
            return [.sad1, .sad2]
        case .fear:
            return [.fear1, .fear2]
        case .anger:
            return [.angry1, .angry2]
        }
    }
    
    init?(label: String?) {
        switch label {
        case "Neutral":
            self = .neutral
        case "Joy":
            self = .happy
        case "Sad", "Sadness":
            self = .sad
        case "Fear":
            self = .fear
        case "Anger":
            self = .anger
        default:
            return nil
        }
    }
}
