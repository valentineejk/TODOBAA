//
//  LoginViewModel.swift
//  TODOBAA
//
//  Created by Valentineejk on 23/08/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    func login() {
        guard validate() else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    public func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
          errorMessage = "please enter email or password"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
          errorMessage = "please enter a correct email "
            return false
        }
        return true
    }
    
}
