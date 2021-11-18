//
//  TOPView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/10/21.
//

import SwiftUI

struct TOPView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @State private var homeElapsedTime = 0.0
    @State private var homeTimer: Timer?
    @State private var homeTimerIsRunning = false
    
    @State private var visitingElapsedTime = 0.0
    @State private var visitingTimer: Timer?
    @State private var visitingTimerIsRunning = false

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
                .edgesIgnoringSafeArea(.all)
            VStack {
                // title label
                Text("Time of Possession")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                // Buttons
                if verticalSizeClass == .regular {
                    // iPhone portrait
                    VStack {
                        Spacer()
                        TOPButtonView(teamName: "Home Team", elapsedTime: $homeElapsedTime, isRunning: $homeTimerIsRunning)
                            .onTapGesture {
                                if homeTimerIsRunning {
                                    stopHomeTimer()
                                } else {
                                    startHomeTimer()
                                }
                            }
                        Spacer()
                        TOPButtonView(teamName: "Visiting Team", elapsedTime: $visitingElapsedTime, isRunning: $visitingTimerIsRunning)
                            .onTapGesture {
                                if visitingTimerIsRunning {
                                    stopVisitingTimer()
                                } else {
                                    startVisitingTimer()
                                }
                            }
                        Spacer()
                    }
                } else if verticalSizeClass == .compact {
                    // iPhone landscape
                    HStack {
                        Spacer()
                        TOPButtonView(teamName: "Home Team", elapsedTime: $homeElapsedTime, isRunning: $homeTimerIsRunning)
                            .onTapGesture {
                                if homeTimerIsRunning {
                                    stopHomeTimer()
                                } else {
                                    startHomeTimer()
                                }
                            }
                        Spacer()
                        TOPButtonView(teamName: "Visiting Team", elapsedTime: $visitingElapsedTime, isRunning: $visitingTimerIsRunning)
                            .onTapGesture {
                                if visitingTimerIsRunning {
                                    stopVisitingTimer()
                                } else {
                                    startVisitingTimer()
                                }
                            }
                        Spacer()
                    }
                } else {
                    // Who knows what else could appear here.
                }
                
                // Footer buttons
                HStack {
                    // reset on left,
                    Button {
                        
                    } label: {
                        Text("Reset")
                    }
                    .padding(.leading)
                    Spacer()
                    // settings on right
                    Button {
                        
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(.trailing)
                }
            }
        }
    }

    func startHomeTimer() {
        stopVisitingTimer()
        homeTimerIsRunning = true
        homeTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            homeElapsedTime += 1.0
        })
    }

    func startVisitingTimer() {
        stopHomeTimer()
        visitingTimerIsRunning = true
        visitingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { _ in
            visitingElapsedTime += 1.0
        })
    }
    
    func stopHomeTimer() {
        homeTimerIsRunning = false
        homeTimer?.invalidate()
        homeTimer = nil
    }
    
    func stopVisitingTimer() {
        visitingTimerIsRunning = false
        visitingTimer?.invalidate()
        visitingTimer = nil
    }

}

struct TOPView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TOPView()
                .previewInterfaceOrientation(.portrait)
            TOPView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}


