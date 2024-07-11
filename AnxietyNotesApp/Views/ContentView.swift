//
//  ContentView.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 08/07/24.
//

import SwiftUI
import NaturalLanguage
import CoreML

struct ContentView: View {
    @State private var viewModel = ViewModel()
    
    var body: some View {
        VStack{
            VStack {
                Text(viewModel.currentDateString())
                    .font(.system(size: 18))
                HStack{
                    TextField("Title...", text: $viewModel.title)
                        .bold()
                        .foregroundColor(.gray)
                        .font(.system(size: 48))
                    Button("Done") {
                        viewModel.saveNote()
                    }
                        .buttonStyle(.bordered)
                }
                TextEditor(text: $viewModel.text)
                    .onChange(of: viewModel.text) { oldValue, newValue in
                        if viewModel.text.last == "."{
                            if let sentence = viewModel.text.lastSentence(){
                                viewModel.feeling = viewModel.indoModel?.predictedLabel(for: sentence) ?? "neutral"
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .overlay{
                        if viewModel.text.isEmpty{
                            VStack{
                                HStack{
                                    Text("Write your journal here...")
                                        .foregroundColor(.black)
                                        .opacity(0.35)
                                    Spacer()
                                }
                                Spacer()
                            }
                            .padding(8)
                        }
                    }
            }
            .padding()
            .background(
                Color.gray
                .opacity(0.4)
            )
            .cornerRadius(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(30)
        .background(
            GradientBackground(feeling: $viewModel.feeling)
        )
    }
}

#Preview {
    ContentView()
        .environment(\.locale, .init(identifier: "id"))
}
