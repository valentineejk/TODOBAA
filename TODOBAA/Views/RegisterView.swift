//
//  RegisterView.swift
//  TODOBAA
//
//  Created by Valentineejk on 24/07/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    var body: some View {
        
        VStack{
            //header
            HeaderView(title: "Register", subtitle: "Start Getting things done", angle: -15, background: .orange)
            Spacer()
            Form {
                
                
                TextField("Full Name", text: $viewModel.fullName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                BtnView(title: "Register", backgroud: .orange) {
                    print("worked")
                }

            }
            .offset(y: -50)
        }
    }
    
}
struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
