//
//  TOPTimer.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/16/21.
//

import Foundation

class TOPTimer {
    // Time of Possession timer
    // Creates a repeating timer that fires every N seconds
    // Notifies a listener every time the timer fires
    // There can only be one listener at at time
    
    private let defaultInterval: Double = 0.1
    private var timer: Timer?

    public private(set) var interval: Double

    var listener: TOPTimerListener?
    
    var isRunning: Bool {
        timer != nil
    }
    
    // Several ways to create a TOPTimer
    init(fireEvery seconds: Double) {
        self.interval = seconds
    }
    
    init(_ seconds: Double) {
        self.interval = seconds
    }
    
    init() {
        self.interval = defaultInterval
    }
    
    // Interact with the timer
    func start() {
        print("Start timer")
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            // Notify listener the timer fired
            self.listener?.timerFired()
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
        print("Stopped timer")
    }
    
    func becomeListener(listener: TOPTimerListener) {
        self.listener = nil
        self.listener = listener
    }
}

protocol TOPTimerListener {
    func timerFired()
}
