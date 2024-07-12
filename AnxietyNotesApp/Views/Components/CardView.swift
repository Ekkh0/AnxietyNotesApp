//
//  CardView.swift
//  AnxietyNotesApp
//
//  Created by Ages on 11/07/24.
//

import SwiftUI

struct CardView: View {
    var body: some View {
    
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
            
            VStack {
                HStack{
                    Text("Judul Note")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    Text("Bulan, tanggal")
                        .font(.system(size: 13))
                        .fontWeight(.regular)
                }
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                        .font(.system(size: 15))
                        .fontWeight(.regular)
                        .frame(minHeight: 100, alignment: .topLeading)
                        .padding()
                }

                
                Spacer()
            }.padding(16)
            
        }.frame(width: 361, height: 210)
            
        
        
    }
}

#Preview {
    CardView()
}
