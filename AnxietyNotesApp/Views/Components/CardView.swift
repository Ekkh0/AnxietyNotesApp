//
//  CardView.swift
//  AnxietyNotesApp
//
//  Created by Ages on 11/07/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .background(.clear)
                .shadow(color: .blackShadowLighter ,radius: 20, y: 3)
            
            VStack {
                HStack{
                    Text("Lorem Ipsum")
                        .opacity(0.75)
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                ZStack(alignment: .topLeading) {
                    Color.lightGray
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: 330, height: 130)
                    
                    Text("Note your mood here :)")
                        .font(.system(size: 13))
                        .opacity(0.75)
                        .fontWeight(.regular)
                        .frame(minHeight: 100, alignment: .topLeading)
                        .padding()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 30, height: 30)
                                .overlay{
                                    Image(systemName: "hand.tap.fill")
                                        .resizable()
                                        .offset(x:-15, y: -15)
                                        .scaledToFit()
                                        .foregroundColor(.indigo)
                                }
                            
                                
                        }
                    }
                }
                Spacer()
            }.padding(16)
            
        }.frame(width: 361, height: 210)
            
            
    }
}

#Preview {
    CardView()
}
