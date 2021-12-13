//
//  Extensions.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 12/6/21.
//

import SwiftUI
import Foundation

extension Color {
    struct TeamColors {
        static var blue: Color { Color("blue") }
        static var burnt: Color { Color("burnt") }
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
    
    var name: String {
        switch self {
        case Color.TeamColors.blue: return "blue"
        case Color.TeamColors.burnt: return "burnt"
        case Color.TeamColors.forest: return "forest"
        case Color.TeamColors.gold: return "gold"
        case Color.TeamColors.graphite: return "graphite"
        case Color.TeamColors.maroon: return "maroon"
        case Color.TeamColors.navy: return "navy"
        case Color.TeamColors.orange: return "orange"
        case Color.TeamColors.pink: return "pink"
        case Color.TeamColors.purple: return "purple"
        case Color.TeamColors.red: return "red"
        case Color.TeamColors.royal: return "royal"
        case Color.TeamColors.silver: return "silver"
        case Color.TeamColors.vegas: return "vegas"
        default: return "white"
        }
    }
}
