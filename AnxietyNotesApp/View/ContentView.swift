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
        }
        .onChange(of: viewModel.feeling){
            viewModel.bgColor = Feelings(rawValue: viewModel.feeling)
            print(viewModel.indoModel?.predictedLabel(for: "Sebel banget sama orang tolol!") as Any)
        }
        .background(viewModel.bgColor?.bgColor)
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
