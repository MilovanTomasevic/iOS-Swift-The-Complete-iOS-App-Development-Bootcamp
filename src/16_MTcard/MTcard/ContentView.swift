//
//  ContentView.swift
//  MTcard
//
//  Created by Milovan Tomašević on 18/11/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.35, green: 0.38, blue: 0.46)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                Image("mt")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150.0, height: 150.0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Milovan Tomašević")
                    .font(Font.custom("Pacifico-Regular", size: 30))
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                InfoView(text: "00 386 40 611 065", imageName: "phone.fill")
                InfoView(text: "tomas.ftn.e2@gmail.com", imageName: "envelope.fill")
                
            }

                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

