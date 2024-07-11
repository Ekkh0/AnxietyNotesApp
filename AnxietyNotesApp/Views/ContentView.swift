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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(LocalizedStringKey("Welcome"))
            Text(LocalizedStringKey("Home"))
            TextField("Diary", text: $viewModel.text)
                .onChange(of: viewModel.text) { oldValue, newValue in
                    if viewModel.text.last == "."{
                        if let sentence = viewModel.text.lastSentence(){
                            viewModel.feeling = viewModel.indoModel?.predictedLabel(for: sentence) ?? "neutral"
                        }
                    }
                }
        }
        .onChange(of: viewModel.feeling){
            print(viewModel.feeling as Any)
            withAnimation {
                viewModel.bgColor = Feelings(label: viewModel.feeling)?.bgColor
            }
        }
        .background(viewModel.bgColor)
        .padding()
        
        HStack{
            Text("Happy")
                .padding()
                .background(.yellow)
                .onTapGesture {
                    viewModel.feeling = "happy"
                }
            Text("Angry")
                .padding()
                .background(.red)
                .onTapGesture {
                    viewModel.feeling = "angry"
                }
            Text("Anxious")
                .padding()
                .background(.orange)
                .onTapGesture {
                    viewModel.feeling = "anxious"
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(\.locale, .init(identifier: "id"))
}
