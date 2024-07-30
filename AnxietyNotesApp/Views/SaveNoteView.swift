//
//  SaveNoteView.swift
//  AnxietyNotesApp
//
//  Created by Ages on 15/07/24.
//

import SwiftUI

struct SaveNoteView: View {
    @State private var viewModel: ViewModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    init(feeling: String? = nil){
        _viewModel = State(initialValue: ViewModel(feeling: feeling))
    }
    
    var body: some View {
        ZStack(){
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 300, height: 300)
                .background(
                    LinearGradient(
                        stops: [
                            Gradient.Stop(color: viewModel.firstColor, location: 0.00),
                            Gradient.Stop(color: viewModel.secondColor, location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.5, y: 0),
                        endPoint: UnitPoint(x: 0.5, y: 1.38)
                    )
                )
                .cornerRadius(300)
                .blur(radius: 125)
            VStack {
                Spacer()
                Text("\(viewModel.feeling) Mood")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.top, 150)
                    .bold()
                viewModel.description
                    .font(.system(size: 17))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
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
                            Text("Save Notes")
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
