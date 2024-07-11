//
//  Feelings.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 09/07/24.
//

import Foundation
import SwiftUI

enum Feelings: String{
    case happy, angry, anxious
    
    var bgColor: Color {
        switch self{
        case .happy:
            return .yellow
        case .angry:
            return .red
        case .anxious:
            return .orange
        }
    }
}
