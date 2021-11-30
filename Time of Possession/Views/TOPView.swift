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
    
    @EnvironmentObject var timer: TOPTimer
    @EnvironmentObject var configuration: Configuration
    
    @State var configurationIsShowing: Bool = false
        
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
                    .foregroundColor(Color("instructionText"))
                    .padding(.top)
                Text("Tap a button to start a timer. Tap again to stop.")
                    .font(.subheadline)
                    .foregroundColor(Color("instructionText"))
                // Buttons
                if verticalSizeClass == .regular {
                    // iPhone portrait
                    VStack {
                        Spacer()
                        TOPButtonView(forHome: true)
                        Spacer()
                        TOPButtonView(forHome: false)
                        Spacer()
                    }
                } else if verticalSizeClass == .compact {
                    // iPhone landscape
                    HStack {
                        Spacer()
                        TOPButtonView(forHome: true)
                        Spacer()
                        TOPButtonView(forHome: false)
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
                    .padding()
                    .disabled(timer.isRunning)
                    Spacer()
                    // settings on right
                    Button {
                        configurationIsShowing.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(.trailing)
                    .disabled(timer.isRunning)
                    .sheet(isPresented: $configurationIsShowing) {
                        ConfigurationView(isPresented: $configurationIsShowing)
                    }

                }
            }
        }
    }
}


struct TOPView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TOPView()
                .preferredColorScheme(.dark)
                .environmentObject(TOPTimer())
                .environmentObject(Configuration())
                .previewInterfaceOrientation(.portrait)
            TOPView()
                .environmentObject(TOPTimer())
                .environmentObject(Configuration())
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}


