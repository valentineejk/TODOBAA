//
//  LoginView.swift
//  TODOBAA
//
//  Created by Valentineejk on 24/07/2023.
//

import SwiftUI

struct LoginView: View {
 @StateObject var viewModel = LoginViewModel()

    var body: some View {
        
        NavigationView {
            VStack{
                //header
                HeaderView(title: "TODOS", subtitle: "Get things done", angle: 15, background: .blue)
             
                //form
                Form{
                    if  !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    TextField("Email adddress", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                    SecureField("Enter Password ",text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                    
                 
                    BtnView(title: "Login", backgroud: .blue) {
                        print("worked")
                        viewModel.login()
                    }


                }
                .offset(y: -50)
                //create account
                VStack{
                    Text("New Arround here?")
//                    Button("Create an account") {
//                        //show registation
//
//                    }
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 10)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
