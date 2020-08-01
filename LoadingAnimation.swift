//
//  LoadingAnimation.swift
//  GolfAppGUI3.0
//
//  Created by Alex on 06/06/2020.
//  Copyright © 2020 Alexandr Čížek. All rights reserved.
//

import SwiftUI

struct LoadingAnimation: View {
    
    @State var animation = false
    let speed: Double = 1
    
    var body: some View {
        
        
        ZStack {
            Image(systemName: "hexagon.fill")
                .resizable()
                .frame(width: 100, height: 110)
                .foregroundColor(Color(red: 1/255, green: 160/255, blue: 96/255))
                .shadow(radius: animation ? 10 : 0)
                .scaleEffect(animation ? 1.1 : 1)
                .animation(Animation.easeInOut(duration: speed).repeatForever(autoreverses: true))
            
            
            
            VStack {
                Image(systemName: "hourglass")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .rotationEffect(.degrees(180))
                    .rotation3DEffect(.degrees(animation ? 180 : 0), axis: (x: animation ? 1 : 0, y: 0, z: 0))
                    .animation(Animation.easeInOut(duration: speed * 2).repeatForever(autoreverses: true).delay(speed))
                
                Text("loading")
                    .font(.custom("Orbitron-Regular", size: 13))
                    .foregroundColor(.white)
                    .opacity(animation ? 1 : 0)
                    .animation(Animation.easeInOut(duration: speed).repeatForever(autoreverses: true))
                
                HStack{
                    Circle().frame(width: 3)
                        .scaleEffect(animation ? 2 : 1)
                        .offset(y: animation ? -4 : 4)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true))
                    Circle().frame(width: 3)
                        .scaleEffect(animation ? 2 : 1)
                        .offset(y: animation ? -4 : 4)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.2))
                    Circle().frame(width: 3)
                        .scaleEffect(animation ? 2 : 1)
                        .offset(y: animation ? -4 : 4)
                        .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true).delay(0.4))
                }.frame(height: 5)
                    .foregroundColor(.white)
            }
        }.onAppear{
            self.animation.toggle()
        }
    }
}


struct LoadingAnimation_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingAnimation()
    }
}
