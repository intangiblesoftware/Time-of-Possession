//
//  Configuration.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/30/21.
//

import Foundation
import SwiftUI

class Configuration: ObservableObject {
    
    private let team: Team
    
    @Published var name: String
    @Published var colorName: String
    @Published var elapsedTime: Double
    @Published var clockIsRunning: Bool
    
    init(for team: Team) {
        self.team = team
        
        let userDefaults = UserDefaults.standard
        
        if team == .home {
            name = userDefaults.string(forKey: Constants.Defaults.homeTeamNameKey) ?? Constants.TeamName.defaultHomeTeamName
            colorName = userDefaults.string(forKey: Constants.Defaults.homeTeamColorNameKey) ?? "forest"
            elapsedTime = userDefaults.double(forKey: Constants.Defaults.homeTeamTimeElapsedKey)
            clockIsRunning = false
        } else {
            name = userDefaults.string(forKey: Constants.Defaults.visitingTeamNameKey) ?? Constants.TeamName.defaultVisitingTeamName
            colorName = userDefaults.string(forKey: Constants.Defaults.visitingTeamColorNameKey) ?? "red"
            elapsedTime = userDefaults.double(forKey: Constants.Defaults.visitingTeamTimeElapsedKey)
            clockIsRunning = false
        }
    }
    
    func save() {
        let userDefaults = UserDefaults.standard
        
        if self.team == .home {
            userDefaults.set(name, forKey: Constants.Defaults.homeTeamNameKey)
            userDefaults.set(colorName, forKey: Constants.Defaults.homeTeamColorNameKey)
            userDefaults.set(elapsedTime, forKey: Constants.Defaults.homeTeamTimeElapsedKey)
            userDefaults.set(clockIsRunning, forKey: Constants.Defaults.homeTeamClockIsRunningKey)
        } else {
            userDefaults.set(name, forKey: Constants.Defaults.visitingTeamNameKey)
            userDefaults.set(colorName, forKey: Constants.Defaults.visitingTeamColorNameKey)
            userDefaults.set(elapsedTime, forKey: Constants.Defaults.visitingTeamTimeElapsedKey)
            userDefaults.set(clockIsRunning, forKey: Constants.Defaults.visitingTeamClockIsRunningKey)
        }
    }
}

