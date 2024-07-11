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
    
    var bgColor: Color {
        switch self{
        case .happy:
            return .yellow
        case .anger:
            return .red
        case .fear:
            return .purple
        case .neutral:
            return .white
        case .sad:
            return .blue
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
        case "Anger":
            self = .anger
        default:
            return nil
        }
    }
}
