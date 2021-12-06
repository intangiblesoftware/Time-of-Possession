//
//  ConfigurationView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/11/21.
//

import SwiftUI

struct ConfigurationView: View {
    @ObservedObject var homeConfig: Configuration
    @ObservedObject var visitorConfig: Configuration
    
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("background"))
            VStack {
                HStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.top, .leading])
                    Button {
                        isPresented.toggle()
                    } label: {
                        Text("Done")
                    }
                    .padding([.top, .trailing])
                    
                }
                Form {
                    Section {
                        TextField("Home team name", text: $homeConfig.teamName, prompt: Text("Team name"))
                        ColorPicker(selectedColor: $homeConfig.teamColor)
                    } header: {
                        Text("Home Team")
                    }
                    Section {
                        TextField("Visiting team name", text: $visitorConfig.teamName, prompt: Text("Team name"))
                        ColorPicker(selectedColor: $visitorConfig.teamColor)
                    } header: {
                        Text("Visiting Team")
                    }
                }
            }.onAppear {
                UITableView.appearance().backgroundColor = .clear
            }
        }
    }
}

struct ColorPicker: View {
    @Binding var selectedColor: Color
    
    private let colors: [Color] = Constants.TeamColors.allTeamColors
    private let columns = [GridItem(.adaptive(minimum: 45, maximum: 55), spacing: 10)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center) {
                ForEach(colors, id:\.self) { color in
                    if color == selectedColor {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(color)
                            .frame(height: 50)
                    } else {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundColor(color)
                            .opacity(0.5)
                            .frame(height: 50)
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
            }
        }.frame(maxHeight: 300)
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView(homeConfig: Configuration(for: .home), visitorConfig: Configuration(for: .visitor), isPresented: .constant(true))

        ConfigurationView(homeConfig: Configuration(for: .home), visitorConfig: Configuration(for: .visitor), isPresented: .constant(true))
            .previewInterfaceOrientation(.landscapeLeft)
            .preferredColorScheme(.dark)
    }
}
