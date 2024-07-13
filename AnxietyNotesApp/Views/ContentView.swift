
import SwiftUI

struct ContentView: View {
    @State private var viewModel = ViewModel(datasource: .shared)
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
//            VStack{
//                TextField("Title...", text: $viewModel.title)
//                Button("Done") {viewModel.saveNote()
//                TextEditor(text: $viewModel.text)
//                    .onChange(of: viewModel.text) { oldValue, newValue in
//                            if viewModel.text.last == "."{
//                                if let sentence = viewModel.text.lastSentence(){
//                                    viewModel.feeling = viewModel.indoModel?.predictedLabel(for: sentence) ?? "neutral"
//                                }
//                            }
//                        }
//                }
//            }
                    VStack {
            
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                HStack(spacing: 3)
                                {
                                    Image(systemName: "chevron.left")
                                    Text("Back")
                                }
                            }
                            Spacer()
                            Text(viewModel.currentDateString())
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                            Spacer()
                            //SAVE
                            Button("Done") {
                                viewModel.saveNote()
                                HomeView.ViewModel.shared.fetchNotes()
                                dismiss()
                            }
                        }
                        .foregroundColor(.indigo)
//                        .frame(width: 360)
//                        .background(.red)
                        HStack{
                            //INPUT TITLE
                            TextField("Title...", text: $viewModel.title)
                                .bold()
                                .font(.system(size: 48))
                            
                        }
                        //INPUT DESC
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
                                                .opacity(0.35)
                                                .allowsHitTesting(false)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                    .padding(.top, 8)
                                    .padding(.leading, 6)
                                }
                            }

                    }
                    .padding()
//                    .background(
//                        Color(UIColor.lightGray)
//                            .opacity(0.4)
//                    )
                    .cornerRadius(40)
                    .padding(8)
//                    .padding(.top, 32)
                    //GRADIENT ANIMATED BG
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear(){
            
        }
        .background(
            GradientBackground(feeling: $viewModel.feeling)
        )
        .ignoresSafeArea(.keyboard)
        
        
        
        
//        VStack {
//            
//            Text(viewModel.currentDateString())
//                .font(.system(size: 18))
//            HStack{
//                //INPUT TITLE
//                TextField("Title...", text: $viewModel.title)
//                    .bold()
//                    .font(.system(size: 48))
//                //SAVE
//                Button("Done") {
//                    viewModel.saveNote()
//                }
//                .buttonStyle(.bordered)
//            }
//            //INPUT DESC
//            TextEditor(text: $viewModel.text)
//                .onChange(of: viewModel.text) { oldValue, newValue in
//                    if viewModel.text.last == "."{
//                        if let sentence = viewModel.text.lastSentence(){
//                            viewModel.feeling = viewModel.indoModel?.predictedLabel(for: sentence) ?? "neutral"
//                        }
//                    }
//                }
//                .scrollContentBackground(.hidden)
//                .overlay{
//                    if viewModel.text.isEmpty{
//                        VStack{
//                            HStack{
//                                Text("Write your journal here...")
//                                    .opacity(0.35)
//                                    .allowsHitTesting(false)
//                                Spacer()
//                            }
//                            Spacer()
//                        }
//                        .padding(.top, 8)
//                        .padding(.leading, 6)
//                    }
//                }
//                .frame(height: 600)
//        }
//        .padding()
//        .background(
//            Color(UIColor.lightGray)
//                .opacity(0.4)
//        )
//        .cornerRadius(30)
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .padding(30)
//        //GRADIENT ANIMATED BG
//        .background(
//            GradientBackground(feeling: $viewModel.feeling)
//        )
    }
}

#Preview {
    ContentView()
        .environment(\.locale, .init(identifier: "id"))
//        .colorScheme(.dark)
}
