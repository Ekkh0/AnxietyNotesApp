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
//            if let note = note {
//                Text(note.sumEmotion!)
//                    .font(.system(size: 18))
//                    .fontWeight(.bold)
//                    .foregroundColor(.bgEditIcon)
//            }else{
//                Text("Write now!")
//                    .font(.system(size: 18))
//                    .fontWeight(.bold)
//                    .foregroundColor(.bgEditIcon)
//            }
            VStack {
                HStack{
                    if let note = note{
                        Text(note.title ?? "")
                            .opacity(0.75)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                    }
                    
                    
                    Spacer()
                    
                    
                    Circle()
                        .fill(colors[0]) // warna emotionnya, tapi blm dynamic
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
                    
                    
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            Rectangle()
//                                .fill(.clear)
//                                .frame(width: 30, height: 30)
//                                .overlay{
//                                    Image(systemName: "hand.tap.fill")
//                                        .resizable()
//                                        .offset(x:-15, y: -15)
//                                        .scaledToFit()
//                                        .foregroundColor(.indigo)
//                                }
//                            
//                                
//                        }
//                    }
                }
                Spacer()
            }.padding(16)
            
        }.frame(width: 361, height: 210)
            
            
    }
}
//
//#Preview {
//    CardView(note: Note(title: "Sample Title", content: "Sample Content", date: Date.now, sumEmotion: "Happy"))
//    
//}
