//
//  TOPTimer.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/16/21.
//

import Foundation

class TOPTimer {
    // Time of Possession timer
    // Creates a repeating timer that fires every second
    
    private var timer: Timer?
    private var interval: Double = 1.0
    
        
    // Interact with the timer
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in

        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
