//
//  TextView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/11/21.
//

import SwiftUI

struct TeamTextView: View {
    var team: String
    
    var body: some View {
        Text(team)
            .font(.system(size: 36))
            .fontWeight(.bold)
    }
}

struct TimerTextView: View {
    var elapsedTime: String
    
    var body: some View {
        Text(elapsedTime)
            .font(.system(size: 48, weight: .regular, design: .monospaced))
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TeamTextView(team: "Janesville")
            TimerTextView(elapsedTime: "00:00:00.0")
        }
    }
}
