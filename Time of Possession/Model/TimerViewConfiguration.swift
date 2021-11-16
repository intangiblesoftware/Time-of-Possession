//
//  TimerViewConfiguration.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/16/21.
//

import Foundation

struct TimerViewConfiguration {
    var name: String = ""
    var color: String = ""
    
    var defaultHomeTeam: TimerViewConfiguration {
        return TimerViewConfiguration(name: "Home Team", color: "green")
    }

    var defaultVisitingTeam: TimerViewConfiguration {
        return TimerViewConfiguration(name: "Visiting Team", color: "red")
    }

    init() {}
        
    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}
