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
            Image("lockscreen")
                .resizable()
                .scaledToFit()
            //Text("emotion: \(entry.sumEmotion)")
        }
    }
}
