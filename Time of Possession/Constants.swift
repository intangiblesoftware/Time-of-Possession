//
//  Constants.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 12/6/21.
//

import SwiftUI

enum Team {
    case home
    case visitor
}

struct Constants {
    struct TeamName {
        static let defaultHomeTeamName = "Home Team"
        static let defaultVisitingTeamName = "Visiting Team"
    }
    
    struct TeamColors {
        static let defaultHomeColor = Color.TeamColors.forest
        static let defaultVisitorColor = Color.TeamColors.red
        static let allTeamColors: [Color] = [Color.TeamColors.blue,
                                             Color.TeamColors.burnt,
                                             Color.TeamColors.forest,
                                             Color.TeamColors.gold,
                                             Color.TeamColors.graphite,
                                             Color.TeamColors.maroon,
                                             Color.TeamColors.navy,
                                             Color.TeamColors.orange,
                                             Color.TeamColors.pink,
                                             Color.TeamColors.purple,
                                             Color.TeamColors.red,
                                             Color.TeamColors.royal,
                                             Color.TeamColors.silver,
                                             Color.TeamColors.vegas]
    }
    
    struct Defaults {
        static let homeTeamNameKey = "homeTeamName"
        static let homeTeamColorNameKey = "homeTeamColorName"
        static let homeTeamTimeElapsedKey = "homeTeamTimeElapsed"
        static let homeTeamClockIsRunningKey = "homeTeamClockIsRunning"
        
        static let visitingTeamNameKey = "visitingTeamName"
        static let visitingTeamColorNameKey = "visitingTeamColorName"
        static let visitingTeamTimeElapsedKey = "visitingTeamTimeElapsed"
        static let visitingTeamClockIsRunningKey = "visitingTeamClockIsRunning"
    }
}

