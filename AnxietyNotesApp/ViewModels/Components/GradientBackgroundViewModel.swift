//
//  GradientBackgroundViewModel.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 11/07/24.
//

import Foundation
import SwiftUI

extension GradientBackground{
    @Observable
    class ViewModel{
        var angle: Double = 0
        var firstColor: Color? = .white
        var secondColor: Color? = .gray
        
        func changeColor(mood: String?){
            var feelingColor = Feelings(label: mood)?.feelingColor
            firstColor = feelingColor?[0]
            secondColor = feelingColor?[1]
        }
    }
}
