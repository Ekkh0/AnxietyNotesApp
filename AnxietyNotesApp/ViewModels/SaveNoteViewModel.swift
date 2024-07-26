//
//  SaveNoteViewModel.swift
//  NoteNMood
//
//  Created by Anggara Satya Wimala Nelwan on 26/07/24.
//

import Foundation
import SwiftUI

extension SaveNoteView{
    
    @Observable
    class ViewModel{
        var feeling: String = "Neutral"
        var firstColor: Color = .neutral1
        var secondColor: Color = .neutral2
        var description: Text = Text("")
        
        init(feeling: String? = nil) {
            self.feeling = feeling ?? "Neutral"
            self.feeling = "\(feeling!.prefix(1).uppercased())\(feeling!.dropFirst())"
            let feelingColor = Feelings(label: feeling)?.feelingColor
            self.firstColor = feelingColor?[0] ?? .white
            self.secondColor = feelingColor?[1] ?? .white
            self.description = {
                switch self.feeling {
                case "Neutral", "neutral":
                    Text("Human is full of emotion\nStay yourself away from negativity")
                case "Joy", "joy":
                    Text("You have eased your anxiety!\nKeep your happy mood today")
                case "Sadness", "sadness":
                    Text("It’s okay to feel sad \nRemember to stay calm today")
                case "Fear", "fear":
                    Text("Breathe In, Breathe Out\nEverything is gonna be fine today")
                case "Anger", "anger":
                    Text("Anger is a valid emotion\nSit down a while relieve it")
                default:
                    Text("")
                }
            }()
        }
    }
}
