//
//  CardLayoutApp.swift
//  CardLayout
//
//  Created by zoya me on 10/13/22.
//

import SwiftUI

@main
struct CardLayoutApp: App {
    
    @State var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
