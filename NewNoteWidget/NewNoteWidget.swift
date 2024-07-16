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
        SimpleEntry(date: Date(), notes: [])
    }
    
    @MainActor
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            let notes = SwiftDataService.shared.fetchNotesForCurrentWeek()
            
            let entry = SimpleEntry(date: Date.now, notes: notes)
            completion(entry)
        }
    }
    
    @MainActor
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
            let notes = SwiftDataService.shared.fetchNotesForCurrentWeek()
            
            
            // Generate a timeline consisting of five entries an hour apart, starting from the current date.
            let currentDate = Date.now
            //        for hourOffset in 0 ..< 5 {
            //            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            //            let entry = SimpleEntry(date: entryDate, notes: notes)
            //
            //            entries.append(entry)
            //        }
            let entry = SimpleEntry(date: currentDate, notes: notes)
            entries.append(entry)
            
            let timeline = Timeline(entries: entries, policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    //    let sumEmotion: String
    let notes: [Note?]
}

struct NewNoteWidgetEntryView : View {
    @Environment(\.widgetFamily) var widgetFamily
    var entry: Provider.Entry
    
    var body: some View {
        //        let feeling = Feelings(label: entry.sumEmotion)
        //        let colors = feeling?.feelingColor ?? [.clear, .clear]
        
        
        switch widgetFamily{
        case .accessoryCircular:
            AccessoryCircularView()
        case .systemSmall:
            //            let todayNote = entry.notes.filter{note in
            //                Calendar.current.isDate(note.date, inSameDayAs: Date())
            //            }
            
            let todayNote = entry.notes.compactMap { $0 }.first { note in
                Calendar.current.isDate(note.date, inSameDayAs: Date())
            }
            
            SmallView(note: todayNote)
        case .systemMedium:
            MediumView(notes: entry.notes)
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

#Preview(as: .systemSmall) {
    NewNoteWidget()
} timeline: {
    //                SimpleEntry(date: .now, sumEmotion: "Neutral")
    //                SimpleEntry(date: .now, sumEmotion: "Joy")
    //                SimpleEntry(date: .now, sumEmotion: "Sad")
    //                SimpleEntry(date: .now, sumEmotion: "Fear")
    //                SimpleEntry(date: .now, sumEmotion: "Anger")
    //                SimpleEntry(date: .now, sumEmotion: "")
    SimpleEntry(date: .now, notes: [nil, nil, nil, nil, nil, nil, nil])
}

