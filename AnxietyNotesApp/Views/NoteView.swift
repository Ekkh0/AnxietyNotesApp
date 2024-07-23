
import SwiftUI

struct NoteView: View {
    @State private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var router: Router
    
    init(note: Note? = nil){
        _viewModel = State(initialValue: ViewModel(datasource: .shared, note: note))
    }
    
    var body: some View {
        ZStack{
            VStack {
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
                                viewModel.feeling = viewModel.emoModel?.predictedLabel(for: sentence) ?? "neutral"
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .overlay{
                        if viewModel.text.isEmpty{
                            VStack{
                                HStack{
                                    Text("Share your feeling with us…")
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
            .cornerRadius(40)
            .padding(8)
            //GRADIENT ANIMATED BG
        }
        .toolbarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.note != nil ? viewModel.getDateString(date: (viewModel.note?.date)!) : viewModel.currentDateString())
        .toolbar{
            ToolbarItem(placement: .topBarTrailing){
                    //SAVE
                    Button("Done") {
                        viewModel.saveNote()
                        HomeView.ViewModel.shared.fetchNotes()
                        router.navigate(to: .saveNoteView)
                    }
                    .foregroundColor(viewModel.text.isEmpty ? Color.gray : Color.indigo)
                    .disabled(viewModel.text.isEmpty)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            GradientBackground(feeling: $viewModel.feeling)
        )
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    NoteView()
        .environment(\.locale, .init(identifier: "id"))
//            .colorScheme(.dark)
}
