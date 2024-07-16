//
//  SaveNoteView.swift
//  AnxietyNotesApp
//
//  Created by Ages on 15/07/24.
//

import SwiftUI

struct SaveNoteView: View {
    @State private var navigateToHome = false
    @Environment(\.colorScheme) var colorScheme
    
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
                    navigateToHome = true
                }, label: {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.saveNoteButton)
                        .fill(.ultraThinMaterial)
                        .stroke(Color(red: 0.78, green: 0.78, blue: 0.78), lineWidth: 1)
                        
                        .overlay{
                            Text("Save Notes")
                                .font(.system(size: 16))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                        }
                })
                .buttonStyle(PlainButtonStyle())
                .frame(width: 300, height: 56, alignment: .center)
            }.padding(.bottom, 80)
            NavigationLink(
                destination: HomeView(),
                isActive: $navigateToHome,
                label: {
                    EmptyView()
                })
                
        }
        .ignoresSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SaveNoteView()
        .colorScheme(.dark)
}
