//
//  SmallView.swift
//  NewNoteWidgetExtension
//
//  Created by Anggara Satya Wimala Nelwan on 15/07/24.
//

import SwiftUI
import WidgetKit

struct SmallView: View {
    let note: Note?
    //    let feeling: Feelings?
    //    let sumEmotion: String?
    //    let colors: [Color]?
    
    var body: some View {
        let colors: [Color] = {
            if let note = note {
                return Feelings(label: note.sumEmotion)?.feelingColor ?? [.clear, .clear]
            } else {
                return [.black, .white]
            }
        }()
        let isEmotionNil: Bool = note?.sumEmotion != nil
        ZStack{
            Rectangle()
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
                .padding(-18)
            VStack (alignment: .leading){
                if colors[0]  != .black {
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
                        .frame(width: 100, height: 90)
                        .offset(x: -10)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 3, y: 5)
                }else{
                    Circle()
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 90)
                        .offset(x: -10)
                }
                Text(isEmotionNil ? "You haven't started today" : "Your today's mood is")
                    .font(.system(size: 7.5))
                    .padding(.top, 2)
                    .foregroundColor(.bgEditIcon)
                HStack(alignment:.center) {
                    if let note = note {
                        Text(note.sumEmotion!)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.bgEditIcon)
                    }else{
                        Text("Write now!")
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .foregroundColor(.bgEditIcon)
                    }
                    Spacer()
                    Link(destination: URL(string: "noteinmood://newNote")!){
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)){
                            Circle()
                                .foregroundColor(.bgEditIcon)
                            Image(systemName: "square.and.pencil")
                                .scaleEffect(0.8)
                                .foregroundColor(.editIcon)
                                .imageScale(.small)
                        }
                        .frame(width: 20, height: 20)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
