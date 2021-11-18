//
//  TOPButtonView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

struct TOPButtonView: View {
    var teamName: String
    
    @Binding var elapsedTime: Double
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(20)
                .foregroundColor(Color("background"))
                .padding()
                .shadow(color: Color("lightShadow"), radius: 5.0, x: -5.0, y: -5.0)
                .shadow(color: Color("darkShadow"), radius: 5.0, x: 5.0, y: 5.0)
            VStack {
                TeamTextView(team: teamName)
                TimerTextView(elapsedTime: $elapsedTime)
                
            }
        }
    }
}

struct TimerTextView: View {
    @Binding var elapsedTime: Double
    
    var body: some View {
        Text(elapsedTimeString(elapsedTime: elapsedTime))
            .font(.system(size: 48, weight: .regular, design: .monospaced))
            .shadow(color: Color("lightShadow"), radius: 2.0, x: -2.0, y: -2.0)
            .shadow(color: Color("darkShadow"), radius: 2.0, x: 2.0, y: 2.0)
    }
    
    func elapsedTimeString(elapsedTime: Double) -> String {
        // Display elapsed time in hh:mm:ss padded with 0s
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.hour, .minute, .second]
        timeFormatter.zeroFormattingBehavior = .pad
        return timeFormatter.string(from: elapsedTime) ?? "00:00:00"
    }
}

struct TeamTextView: View {
    var team: String
    
    var body: some View {
        Text(team)
            .font(.system(size: 36))
            .fontWeight(.bold)
    }
}

