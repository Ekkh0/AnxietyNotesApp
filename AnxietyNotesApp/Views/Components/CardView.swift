//
//  CardView.swift
//  AnxietyNotesApp
//
//  Created by Ages on 11/07/24.
//

import SwiftUI

struct CardView: View {
    let note: Note?
    
    var body: some View {
        let colors: [Color] = {
            if let note = note {
                return Feelings(label: note.sumEmotion)?.feelingColor ?? [.clear, .clear]
            } else {
                return [.black, .white]
            }
        }()
        
        ZStack {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .background(.clear)
                .shadow(color: .blackShadowLighter ,radius: 10)
            VStack {
                HStack{
                    if let note = note{
                        Text("\(note.date.formatted(date: .abbreviated, time: .shortened))")
                            .opacity(0.75)
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                    }
                    Spacer()
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    Gradient.Stop(color: colors[1], location: 0.00),
                                    Gradient.Stop(color: colors[0], location: 1.00)
                                ]),
                                startPoint: UnitPoint(x: 0.86, y: 1),
                                endPoint: UnitPoint(x: 0.16, y: 0)
                            )
                        )
                        .frame(width: 17)
                }
                ZStack(alignment: .topLeading) {
                    Color.lightGray
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .frame(width: 330, height: 130)
                    if let note = note{
                        Text(note.content ?? "")
                            .font(.system(size: 13))
                            .opacity(0.75)
                            .fontWeight(.regular)
                            .frame(minHeight: 100, alignment: .topLeading)
                            .padding()
                    }
                }
                Spacer()
            }.padding(16)
        }.frame(width: 361, height: 210)
    }
}
