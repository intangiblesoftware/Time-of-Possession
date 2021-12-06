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

    @StateObject var homeConfiguration = Configuration(for: .home)
    @StateObject var visitorConfiguration = Configuration(for: .visitor)
    
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
                if verticalSizeClass == .compact {
                    HStack {
                        Spacer()
                        TOPButtonView(configuration: homeConfiguration)
                        Spacer()
                        TOPButtonView(configuration: visitorConfiguration)
                        Spacer()
                    }
                } else {
                    VStack {
                        Spacer()
                        TOPButtonView(configuration: homeConfiguration)
                        Spacer()
                        TOPButtonView(configuration: visitorConfiguration)
                        Spacer()
                    }
                }
                
                // Footer buttons
                HStack {
                    // reset on left,
                    Button {
                    } label: {
                        Text("Reset")
                    }
                    .padding()
                    Spacer()
                    // settings on right
                    Button {
                        configurationIsShowing.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $configurationIsShowing) {
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
                .previewInterfaceOrientation(.portrait)
            TOPView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}


