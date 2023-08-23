//
//  TODOBAAApp.swift
//  TODOBAA
//
//  Created by Valentineejk on 25/06/2023.
//

import SwiftUI
import FirebaseCore


@main
struct TODOBAAApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
