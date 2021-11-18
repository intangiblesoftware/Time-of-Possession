//
//  Time_of_PossessionApp.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

@main

struct Time_of_PossessionApp: App {
    @StateObject private var sharedTimer: TOPTimer = TOPTimer()
    
    var body: some Scene {
        WindowGroup {
            TOPView().environmentObject(sharedTimer)
        }
    }
}
