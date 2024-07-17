import SwiftUI
import WidgetKit

struct HomeView: View {
    @State private var viewModel = HomeView.ViewModel.shared
    var sorter = ["All", "Neutral", "Happy", "Sad", "Fear", "Anger"]
    @State private var selectedPicker = "Latest" {
        didSet {
            print("Changed")
            viewModel.selectedEmotion = selectedPicker
            viewModel.fetchNotesByEmotion()
        }
    }
    @EnvironmentObject var router: Router
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.indigo]
    }
    
    var body: some View {
            ZStack{
                VStack {
                    if viewModel.notes.isEmpty{
                        VStack{
                            Image(.notebookBro1)
                                .resizable()
                                .frame(width: 198, height: 198)
                            VStack {
                                Text("Express your feeling")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.bottom, 4)
                                Text("Start writing to help you calm and relieve your anxiety")
                                    .multilineTextAlignment(.center)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .center)
                        .padding(.bottom, 16)
                    }
                    
                    
                }
                .padding()
                .navigationTitle("How was your day?")
                .navigationBarTitleDisplayMode(.large)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing)
                    {
                        Button {
                            viewModel.showingPopover = true
                        } label: {
                            HStack(spacing: 3)
                            {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .foregroundColor(.indigo)
                            }
                        }
                        .popover(isPresented: $viewModel.showingPopover) {
                            
                            List {
                                Picker("Sort By: ", selection: $selectedPicker) {
                                        ForEach(sorter, id: \.self) {
                                            Text($0)
                                        }
                                    }
                                    .pickerStyle(.inline)
                            }
                            .presentationCompactAdaptation(.none)
                            .frame(minWidth: 200, minHeight: 320)
                        }
                    }
                    ToolbarItem(placement: .bottomBar)
                    {
                        NavigationLink(destination: NoteView() .navigationBarBackButtonHidden(true)) {
                            
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.indigo)
                        }
                    }
                }
                .toolbarBackground(.visible, for: .bottomBar)
                
//                ScrollView {
                    List{
                        ForEach(viewModel.notes, id: \.self) { note in
                            SmallCardView(note: note)
                                .listRowSeparator(.hidden)
                                .listSectionSeparator(.hidden)
                                
                                .overlay{
                                    NavigationLink(destination: NoteView(note: note)) {
                                        EmptyView()
                                    }
                                    .navigationBarBackButtonHidden(true)
                                    .opacity(0)
                                }
                                .swipeActions{
                                    Button(role: .destructive) {
                                        viewModel.deleteNote(note: note)
                                        viewModel.fetchNotes()
                                        WidgetCenter.shared.reloadTimelines(ofKind: "NewNoteWidget")
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                    
//                }
            }
            .onChange(of: selectedPicker) {
                print("Changed")
                viewModel.selectedEmotion = selectedPicker
                if selectedPicker == "All"{
                    viewModel.fetchNotes()
                }
                else{
                    viewModel.fetchNotesByEmotion()
                }
            }
        }

    }
    
    


#Preview {
    HomeView()
//        .colorScheme(.dark)
}
