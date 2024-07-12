//
//  GradientBackground.swift
//  AnxietyNotesApp
//
//  Created by Dharmawan Ruslan on 11/07/24.
//

import Foundation
import SwiftUI

struct GradientBackground: View{
    @State var viewModel = ViewModel()
    @Binding var feeling: String?
    
    var body: some View{
        ZStack{
            AngularGradient(colors: [viewModel.firstColor!, viewModel.secondColor!, viewModel.firstColor!], center: .center)
                .rotationEffect(Angle(degrees: viewModel.angle))
                .onAppear{
                    Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { _ in
                        withAnimation(.linear(duration: 2)) {
                            viewModel.angle+=180
                        }
                    })
                }
                .edgesIgnoringSafeArea(.all)
                .frame(width: 1400, height: 1400)
                .onChange(of: feeling) { oldValue, newValue in
                    viewModel.changeColor(mood: feeling)
                }
            Rectangle()
                .foregroundColor(.white)
                .frame(width: UIScreen.main.bounds.width-10, height: UIScreen.main.bounds.height-20)
                .cornerRadius(40)
                .padding([.bottom], 25)
                .blur(radius: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
