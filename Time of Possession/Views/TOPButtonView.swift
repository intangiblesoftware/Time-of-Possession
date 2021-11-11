//
//  TOPButtonView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

struct TOPButtonView: View {

    let feedbackGenerator = UINotificationFeedbackGenerator()
    
    @State private var color: Color
    @State private var team: String
    @State private var elapsedTime = 0
    @State private var timerIsRunning = false
    @State private var resetAlertIsShowing = false
    @State private var timer:Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            elapsedTime += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func resetTimer() {
        timer?.invalidate()
        elapsedTime = 0
    }
    
    func formattedElapsedTime () -> String {
        let hours = (elapsedTime / 36000)
        let minutes = (elapsedTime / 600) % 60
        let seconds = (elapsedTime / 10) % 60
        let tenths = elapsedTime % 10
        return String(format: "%02d:%02d:%02d.%1d", hours, minutes, seconds, tenths)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .animation(.easeInOut(duration: 0.3), value: timerIsRunning)
                .foregroundColor(color)
                .opacity(timerIsRunning ? 1.0 : 0.5)
                .edgesIgnoringSafeArea(.bottom)
                .onTapGesture {
                    if timerIsRunning {
                        stopTimer()
                    } else {
                        startTimer()
                    }
                    timerIsRunning.toggle()
                }
                .onLongPressGesture {
                    if !timerIsRunning {
                        resetAlertIsShowing = true
                        feedbackGenerator.notificationOccurred(.success)
                    }
                }
            VStack {
                InstructionView(timerIsRunning: $timerIsRunning)
                    .animation(.easeInOut(duration: 0.3), value: timerIsRunning)
                Spacer()
            }
            VStack {
                TeamTextView(team: team)
                TimerTextView(elapsedTime: formattedElapsedTime())
            }
        }
        .alert("Reset Timer?", isPresented: $resetAlertIsShowing) {
            Button("Cancel", role: .cancel, action: {
                resetAlertIsShowing = false
            })
            Button("Reset", role: .destructive) {
                resetTimer()
                resetAlertIsShowing = false
            }
        }
    }
    
    var instructionView: some View {
        @Binding var timerIsRunning: Bool
        
        VStack {
            if timerIsRunning {
                Text("Tap anywhere to stop")
                    .foregroundColor(Color("instructionText"))
            } else {
                Text("Tap anywhere to start")
                    .foregroundColor(Color("instructionText"))
                Text("Long press to reset timer")
                    .foregroundColor(Color("instructionText"))
            }
            Spacer()
            HStack(alignment: .bottom){
                Spacer()
                Button(action: {
                    // Show configuration view
                }) {
                    Image(systemName: "gear")
                        .font(.title)
                        .foregroundColor(Color("instructionText"))
                }
            }
        }
    }
}

struct TOPButtonView_Previews: PreviewProvider {
    static var previews: some View {
        TOPButtonView(color: Color.red, team: "Janesville")
            .previewDevice("iPod touch (7th generation)")
    }
}

