//
//  TOPTimer.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/16/21.
//

import Foundation

class TOPTimer: ObservableObject {
    // Time of Possession timer
    // Creates a repeating timer that fires every second
    // Notifies a listener every time the timer fires
    // There can only be one listener at at time
    
    private var timer: Timer?
    private var interval: Double = 1.0
    
    var listener: TOPTimerListener?
    @Published var isRunning: Bool = false
        
    // Interact with the timer
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { theTimer in
            self.listener?.elapsedTime += self.interval
        }
        isRunning = true
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        
        listener?.isListener = false
        listener = nil
        
        isRunning = false
    }
    
    func becomeListener(newListener: TOPTimerListener) {
        // Tell the other one they're no longer listening
        self.listener?.isListener = false
        self.listener = nil
        
        // Now make the new one the listener and tell them so
        self.listener = newListener
        self.listener?.isListener = true
    }
}

protocol TOPTimerListener {
    var isListener: Bool { set get }
    var elapsedTime: Double { set get }
}
