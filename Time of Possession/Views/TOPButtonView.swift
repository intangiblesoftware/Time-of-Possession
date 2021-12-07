//
//  TOPButtonView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI
import Combine


struct TOPButtonView: View {
    @ObservedObject var configuration: Configuration
    
    var body: some View {
        ZStack {
            if configuration.clockIsRunning {
                Rectangle()
                    .foregroundColor(configuration.teamColor)
                    .padding()
                    .shadow(color: Color("darkShadow"), radius: 2.0, x: 3.0, y: 3.0)
            } else {
                Rectangle()
                    .foregroundColor(configuration.teamColor)
                    .padding()
                    .shadow(color: Color("darkShadow"), radius: 10.0, x: 5.0, y: 5.0)
                    .opacity(0.5)
            }
            VStack {
                TeamTextView(team: $configuration.teamName)
                ClockTextView(elapsedTime: $configuration.elapsedTime)
            }
        }
    }
}

struct ClockTextView: View {
    @Binding var elapsedTime: Double
    
    var body: some View {
        Text(elapsedTimeString(elapsedTime: elapsedTime))
            .font(.system(size: 48, weight: .regular, design: .monospaced))
            .foregroundColor(Color("instructionText"))
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
    @Binding var team: String
    
    var body: some View {
        Text(team)
            .font(.system(size: 36))
            .fontWeight(.bold)
            .foregroundColor(Color("instructionText"))
    }
}

