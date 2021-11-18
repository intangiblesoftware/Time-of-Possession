//
//  TOPTimer.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/16/21.
//

import Foundation

class TOPTimer: ObservableObject {
    // Time of Possession timer
    // Creates a repeating timer that fires every N seconds
    // Notifies a listener every time the timer fires
    // There can only be one listener at at time
    
    private let defaultInterval: Double = 1.0
    private var timer: Timer?

    public private(set) var interval: Double
    
    @Published var isRunning: Bool = false
    @Published var elapsedTime: Double = 0.0
    
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
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            self.elapsedTime += self.interval
        }
    }
    
    func stop() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
    
}
