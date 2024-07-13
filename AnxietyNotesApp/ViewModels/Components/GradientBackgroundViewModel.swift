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
        var secondColor: Color? = .white
        
        func changeColor(mood: String?){
            let feelingColor = Feelings(label: mood)?.feelingColor
            withAnimation(.easeOut(duration: 2)) {            
                firstColor = feelingColor?[0]
                secondColor = feelingColor?[1]
            }
        }
    }
}
