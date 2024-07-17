//
//  MediumView.swift
//  NewNoteWidgetExtension
//
//  Created by Anggara Satya Wimala Nelwan on 15/07/24.
//

import SwiftUI
import WidgetKit

struct MediumView: View {
    let notes: [Note?]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text("Your last 7 days")
                    .font(.system(size: 30, weight: .bold, design: .default))
                Spacer()
                Link(destination: URL(string: "noteinmood://newNote")!){
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                        Circle()
                            .foregroundColor(.bgEditIcon)
                        Image(systemName: "square.and.pencil")
                            .scaleEffect(1.2)
                            .foregroundColor(.editIcon)
                            .imageScale(.small)
                    }
                    .frame(width: 30, height: 30)
                }
            }
            Text("Write everyday to complete!")
                .font(.system(size: 15, weight: .regular, design: .default))
                .padding(.bottom, 15)
            HStack{
                ForEach(0..<7){index in
                    let colors: [Color] = {
                        if let note = notes[index] {
                            return Feelings(label: note.sumEmotion)?.feelingColor ?? [.clear, .clear]
                        } else {
                            return [.black, .white]
                        }
                    }()
//                    Link(destination: URL(string: colors[0] != .black ?  "noteinmood://newNote?noteID=\(notes[index]?.id.uuidString ?? "")" : "noteinmood://newNote")!){
                    Link(destination: URL(string: "noteinmood://newNote?noteID=73BF3940-AE23-45D0-9D6E-E7E1911AB2FF")!){
                        if colors[0] != .black{
                            Circle()
                                .fill(
                                    LinearGradient(
                                        stops: [
                                            Gradient.Stop(color: colors[0], location: 0.00),
                                            Gradient.Stop(color: colors[1], location: 1.00),
                                        ],
                                        
                                        startPoint: UnitPoint(x: 0.16, y: 0),
                                        endPoint: UnitPoint(x: 0.86, y: 1)
                                    )
                                )
                        }else{
                            Circle()
                                .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}
