//
//  BtnView.swift
//  TODOBAA
//
//  Created by Valentineejk on 23/08/2023.
//

import SwiftUI

struct BtnView: View {
    let title: String
    let backgroud: Color
    let action: () -> Void
    var body: some View {
        Button {
            print("hey hey")
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroud)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()

    }
}

struct BtnView_Previews: PreviewProvider {
    static var previews: some View {
        BtnView(title: "title", backgroud: .black, action: {})
    }
}
