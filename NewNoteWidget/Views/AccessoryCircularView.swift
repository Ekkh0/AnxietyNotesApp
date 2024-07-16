//
//  AccessoryCircularView.swift
//  NewNoteWidgetExtension
//
//  Created by Anggara Satya Wimala Nelwan on 15/07/24.
//

import SwiftUI
import WidgetKit

struct AccessoryCircularView: View {
    var body: some View {
        Link(destination: URL(string: "noteinmood://newNote")!){
            Image(systemName: "square.and.pencil")
            //Text("emotion: \(entry.sumEmotion)")
        }
    }
}
