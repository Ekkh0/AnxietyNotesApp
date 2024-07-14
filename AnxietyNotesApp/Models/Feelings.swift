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
            return [.yellow, .orange.opacity(0.5)]
        case .sad:
            return [.blue, .cyan.opacity(0.5)]
        case .fear:
            return [.purple, .indigo.opacity(0.5)]
        case .anger:
            return [.red, .pink.opacity(0.5)]
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
