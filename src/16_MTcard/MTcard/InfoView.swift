//
//  InfoView.swift
//  MTcard
//
//  Created by Milovan Tomašević on 18/11/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay(HStack {
                Image(systemName: imageName)
                    .foregroundColor(.gray)
                Text(text)
                .foregroundColor(Color(.gray))
                
            })
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
