//
//  Configuration.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/30/21.
//

import Foundation
import SwiftUI

class Configuration: ObservableObject {
    
    @Published var teamName: String
    @Published var teamColor: Color
    @Published var elapsedTime: Double

    init(for team: Team) {
        if team == .home {
            teamName = Constants.TeamName.defaultHomeTeamName
            teamColor = Constants.TeamColors.defaultHomeColor
            elapsedTime = 0.0
        } else {
            teamName = Constants.TeamName.defaultVisitingTeamName
            teamColor = Constants.TeamColors.defaultVisitorColor
            elapsedTime = 0.0
        }
    }
    
    init(name: String, color: Color) {
        teamName = name
        teamColor = color
        elapsedTime = 0.0
    }
}

