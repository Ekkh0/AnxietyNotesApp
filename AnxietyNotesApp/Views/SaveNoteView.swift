//
//  SaveNoteView.swift
//  AnxietyNotesApp
//
//  Created by Ages on 15/07/24.
//

import SwiftUI

struct SaveNoteView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack{
            Image("SaveNoteImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)

            VStack {
                
                Text("Take a deep breath \nand feel the relief")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 150)
                    .bold()
                
                Spacer()
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.saveNoteButton)
                        .fill(.ultraThinMaterial)
                        .stroke(Color(red: 0.78, green: 0.78, blue: 0.78), lineWidth: 1)
                        
                        .overlay{
                            Text("Save Note")
                                .font(.system(size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 300, height: 56, alignment: .center)
            }.padding(.bottom, 80)
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SaveNoteView()
        .colorScheme(.dark)
}
