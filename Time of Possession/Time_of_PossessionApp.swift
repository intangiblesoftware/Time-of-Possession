//
//  Time_of_PossessionApp.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

@main

struct Time_of_PossessionApp: App {
    @StateObject var sharedTimer: TOPTimer = TOPTimer()
    @StateObject var configuration: Configuration = Configuration()
    
    var body: some Scene {
        WindowGroup {
            TOPView().environmentObject(sharedTimer).environmentObject(configuration)
        }
    }
}
