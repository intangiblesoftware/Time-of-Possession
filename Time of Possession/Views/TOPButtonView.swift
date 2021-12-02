//
//  TOPButtonView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI
import Combine

enum Team {
    case home
    case visitor
}

struct TOPButtonView: View {
    @EnvironmentObject var configuration: Configuration
    
    var team: Team
    
    @State private var timer: Timer? = nil
    @State private var isRunning = false
    
    var body: some View {
        ZStack {
            if isRunning {
                Rectangle()
                    .foregroundColor(team == .home ? configuration.homeColor : configuration.visitingColor)
                    .padding()
                    .shadow(color: Color("darkShadow"), radius: 2.0, x: 3.0, y: 3.0)
            } else {
                Rectangle()
                    .foregroundColor(team == .home ? configuration.homeColor : configuration.visitingColor)
                    .padding()
                    .shadow(color: Color("darkShadow"), radius: 10.0, x: 5.0, y: 5.0)
                    .opacity(0.5)
            }
            VStack {
                TeamTextView(team: team == .home ? $configuration.homeTeam : $configuration.visitingTeam)
                TimerTextView(elapsedTime: team == .home ? $configuration.homeElapsedTime : $configuration.visitingElapsedTime)
            }
        }.onTapGesture {
            isRunning ? stopTimer() : startTimer()
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            if team == .home {
                configuration.homeElapsedTime += 1.0
            } else {
                configuration.visitingElapsedTime += 1.0
            }
        })
        isRunning = true
    }
    
    func stopTimer() {
        isRunning = false
        timer?.invalidate()
        timer = nil
    }
}


struct TimerTextView: View {
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

