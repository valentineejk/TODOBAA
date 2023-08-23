//
//  RegisterViewModel.swift
//  TODOBAA
//
//  Created by Valentineejk on 23/08/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    
    init(email: String = "", password: String = "", fullName: String = "") {
        self.fullName = fullName
        self.email = email
        self.password = password
        
    }
    
    func register () {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.addUserRecords(id: userId)
        }
        
    }
    public func addUserRecords(id: String) {
        let newUser = User(id: id, fullName: fullName, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("user").document(id).setData(newUser.asDictionary())
        
    }
    public func validate() -> Bool {
        errorMessage = ""
        guard !fullName.trimmingCharacters(in: .whitespaces).isEmpty, !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
          errorMessage = "please enter email or password"
            return false
        }
        guard email.contains("@") && email.contains(".") else {
          errorMessage = "please enter a correct email "
            return false
        }
        
        guard password.count > 6 else {
          errorMessage = "please enter a correct email "
            return false
        }
        return true
    }
}
