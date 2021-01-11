//
//  ProgressBar.swift
//  projet_simplon_v1.1
//
//  Created by emm on 26/06/2020.
//  Copyright © 2020 emm. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
//    @State var defi: ListDefi
    @State var percent: CGFloat = 0
    
    var body: some View {
        VStack{
            Loader(percent: percent)
//            if defi.number == 5 {
//                self.percent = 100
//            }
            HStack{
                Slider(value: $percent, in: 0...100)

            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}



struct Loader : View {
    
    var percent: CGFloat = 0
    var colors : [Color] { percent >= 100 ? [.green ] : [.yellow,.green ]}
    var body: some View{
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 100, height:  100)
            .overlay(
                
                Circle()
                    .trim(from: 0, to: percent * 0.01)
                    .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .fill(AngularGradient(gradient: .init(colors: colors), center: .center, startAngle: .zero, endAngle: .init(degrees: 360)))
            )

        }
    }
}
