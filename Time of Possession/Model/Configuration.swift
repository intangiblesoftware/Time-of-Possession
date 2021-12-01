//
//  Configuration.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/30/21.
//

import Foundation
import SwiftUI

class Configuration: ObservableObject {
    
    static let defaultHomeTeam: String = "Home Team"
    static let defaultVisitingTeam: String = "Visiting Team"
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

    @Published var homeTeam: String
    @Published var visitingTeam: String
    
    @Published var homeColor: Color
    @Published var visitingColor: Color
    
    @Published var homeElapsedTime: Double
    @Published var visitingElapsedTime: Double

    init() {
        homeTeam = Configuration.defaultHomeTeam
        homeColor = Color.TeamColors.defaultHomeColor
        visitingTeam = Configuration.defaultVisitingTeam
        visitingColor = Color.TeamColors.defaultVisitorColor
        homeElapsedTime = 0.0
        visitingElapsedTime = 0.0
    }
    
    init(homeTeam: String, homeColor: Color, visitingTeam: String, visitingColor: Color, homeElapsedTime: Double, visitingElapsedTime: Double) {
        self.homeTeam = homeTeam
        self.homeColor = homeColor
        self.visitingTeam = visitingTeam
        self.visitingColor = visitingColor
        self.homeElapsedTime = homeElapsedTime
        self.visitingElapsedTime = visitingElapsedTime
    }
    
}

extension Color {
    struct TeamColors {
        static var blue: Color { Color("blue") }
        static var burnt: Color { Color("burnt") }
        static var defaultHomeColor: Color { Color("homeDefault") }
        static var defaultVisitorColor: Color { Color("visitorDefault") }
        static var forest: Color { Color("forest") }
        static var gold: Color { Color("gold") }
        static var graphite: Color { Color("graphite") }
        static var maroon: Color { Color("maroon") }
        static var navy: Color { Color("navy") }
        static var orange: Color { Color("orange") }
        static var pink: Color { Color("pink") }
        static var purple: Color { Color("purple") }
        static var red: Color { Color("red") }
        static var royal: Color { Color("royal") }
        static var silver: Color { Color("silver") }
        static var vegas: Color { Color("vegas") }

    }
}
