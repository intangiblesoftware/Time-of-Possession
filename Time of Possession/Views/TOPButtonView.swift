//
//  TOPButtonView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

struct TOPButtonView: View, TOPTimerListener {
    let configuration: TimerViewConfiguration
    let timer: TOPTimer
    let timeFormatter: DateComponentsFormatter
    
    @State private var team: String
    @State private var color: String
    @State private var elapsedTime: Double = 0.0
    
    init(with configuration: TimerViewConfiguration, and timer: TOPTimer) {
        self.configuration = configuration
        self.team = configuration.name
        self.color = configuration.color
        self.timer = timer
        
        // Display elapsed time in hh:mm:ss padded with 0s
        timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.hour, .minute, .second]
        timeFormatter.zeroFormattingBehavior = .pad
    }

    var body: some View {

        ZStack {
            Rectangle()
                .animation(.easeInOut(duration: 0.3), value: timer.isRunning)
                .foregroundColor(Color(color))
                .opacity(timer.isRunning ? 1.0 : 0.5)
                .edgesIgnoringSafeArea(.bottom)
                .onTapGesture {
                    if timer.isRunning {
                        timer.stop()
                    } else {
                        timer.becomeListener(listener: self)
                        timer.start()
                    }
                }
                .onLongPressGesture {
                    // Reset timer if it's not running
                }
            VStack {
                Spacer()
            }
            VStack {
                TeamTextView(team: team)
                TimerTextView(elapsedTime: timeFormatter.string(from: elapsedTime) ?? "00:00:00.0")
            }
        }
    }
    
    // Conform to TOPTimerListener protocol
    func timerFired() {
        elapsedTime += timer.interval
        
    }
}

struct InstructionView: View {
    @Binding var timerIsRunning: Bool
    @Binding var teamName: String
    @Binding var teamColor: String
    
    @State private var configurationIsShowing = false
    
    var body: some View {
        VStack {
            if timerIsRunning {
                Text("Tap anywhere to stop")
                    .foregroundColor(Color("instructionText"))
                    .padding()
            } else {
                Text("Tap anywhere to start")
                    .foregroundColor(Color("instructionText"))
                    .padding(.top)
                Text("Long press to reset timer")
                    .foregroundColor(Color("instructionText"))
            }
            Spacer()
            HStack(alignment: .bottom){
                Spacer()
                Button(action: {
                    // Show configuration view
                    configurationIsShowing = true
                }) {
                    Image(systemName: "gear")
                        .font(.title)
                        .foregroundColor(Color("instructionText"))
                }
                .disabled(timerIsRunning)
                .sheet(isPresented: $configurationIsShowing) {
                    // Do something on dismiss?
                } content: {
                    ConfigurationView(teamName: $teamName, colorName: $teamColor)
                }
                .padding([.trailing, .bottom])

            }
        }
    }
}


struct TOPButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TOPButtonView(with: TimerViewConfiguration().defaultHomeTeam, and: TOPTimer())
            
    }
}

