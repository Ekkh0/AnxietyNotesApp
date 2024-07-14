//
//  NewNoteWidget.swift
//  NewNoteWidget
//
//  Created by Anggara Satya Wimala Nelwan on 13/07/24.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), sumEmotion: "")
    }
    
    @MainActor
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let notes = SwiftDataService.shared.fetchNotes()
        
        let latestNote = notes.first
        let sumEmotion = latestNote?.sumEmotion ?? ""
        
        let entry = SimpleEntry(date: Date(), sumEmotion: sumEmotion)
        completion(entry)
    }
    
    @MainActor
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let notes = SwiftDataService.shared.fetchNotes()
        
        let latestNote = notes.last
        print("Notes in timeline: \(latestNote?.sumEmotion ?? "no")")
        let sumEmotion = latestNote?.sumEmotion ?? ""
        let currentDate = Date()

        let entry = SimpleEntry(date: currentDate, sumEmotion: sumEmotion)
        entries.append(entry)
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let sumEmotion: String
}

struct NewNoteWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    
    var entry: Provider.Entry
    
    var body: some View {
//        VStack {
//            Link(destination: URL(string: "noteinmood://newNote")!){
//                Image(systemName: "plus.circle.fill")
//                    .resizable()
//            }
//        }
        
        let feeling = Feelings(label: entry.sumEmotion)
        let isEmotionNil = entry.sumEmotion.isEmpty
        let colors = feeling?.feelingColor ?? [.clear, .clear]
        
        
        
            
        switch widgetFamily{
        case .accessoryCircular:
            Link(destination: URL(string: "noteinmood://newNote")!){
                Image(systemName: "square.and.pencil")
                //Text("emotion: \(entry.sumEmotion)")
            }
            
        case .systemSmall:
            VStack (alignment: .leading){
                Circle()
                    .fill(
                        LinearGradient(
                        stops: [
                            Gradient.Stop(color: colors[0], location: 0.00),
                            Gradient.Stop(color: colors[1], location: 1.00),
                        ],
                        
                        startPoint: UnitPoint(x: 0.16, y: 0),
                        endPoint: UnitPoint(x: 0.86, y: 1)
                        )
                    )
                    .overlay(
                        Circle()
                            .stroke(entry.sumEmotion.isEmpty ? Color.dash : Color.clear, style: StrokeStyle(lineWidth: 1, dash: [5]))
                            .frame(width: 100, height: 90)
                            
                    )
                    .frame(width: 100, height: 90)
                    .offset(x: -10)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 3, y: 5)
                
                
                Text(isEmotionNil ? "You haven't started today" : "Your today's mood is")
                    .font(.system(size: 7.5))
                    .padding(.top, 2)
                    .padding(.bottom, -10)
                    .foregroundColor(.bgEditIcon)

                
                HStack {
                    Text(isEmotionNil ? "Write now!" : entry.sumEmotion)
                        .font(.system(size: 18))
                        .padding(.top, 3)
                        .fontWeight(.bold)
                        .foregroundColor(.bgEditIcon)
                    
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "square.and.pencil")
                            .resizable()
                            .offset(x: 0.5)
                            .frame(width: 10, height: 10, alignment: .center)
                            
           
                    })
                    .foregroundColor(.editIcon)
                    .background(.bgEditIcon)
                    .accentColor(.bgEditIcon)
                    .frame(width: 18, height: 18)
                    .clipShape(Circle())
                    .offset(y: 2)
                    
                }
                .padding(.bottom, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 20)
            
        case .systemMedium:
            Text("Medium")
            
        default:
            Text("Default")
        }
        
    }
    

    
}

struct NewNoteWidget: Widget {
    let kind: String = "NewNoteWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            if #available(iOS 17.0, *) {
                NewNoteWidgetEntryView(entry: entry)
                    .containerBackground(.fill.tertiary, for: .widget)
                    
                
                    
            } else {
                NewNoteWidgetEntryView(entry: entry)
                    .padding()
                    .background()
            }
            
        }
        .configurationDisplayName("Quick New Notes")
        .description("This is a widget to add new notes quickly.")
        .supportedFamilies([.accessoryCircular, .systemSmall, .systemMedium])
        
    }
}

#Preview(as: .accessoryCircular) {
    NewNoteWidget()
} timeline: {
    SimpleEntry(date: .now, sumEmotion: "Neutral")
    SimpleEntry(date: .now, sumEmotion: "Joy")
    SimpleEntry(date: .now, sumEmotion: "Sad")
    SimpleEntry(date: .now, sumEmotion: "Fear")
    SimpleEntry(date: .now, sumEmotion: "Anger")
    SimpleEntry(date: .now, sumEmotion: "")
}
