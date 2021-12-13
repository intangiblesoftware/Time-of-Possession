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
                        TextField("Home team name", text: $homeConfig.name, prompt: Text("Team name"))
                        ColorPicker(selectedColorName: $homeConfig.colorName)
                    } header: {
                        Text("Home Team")
                    }
                    Section {
                        TextField("Visiting team name", text: $visitorConfig.name, prompt: Text("Team name"))
                        ColorPicker(selectedColorName: $visitorConfig.colorName)
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
    @Binding var selectedColorName: String
    
    private let colors: [Color] = Constants.TeamColors.allTeamColors
    private let columns = [GridItem(.adaptive(minimum: 45, maximum: 55), spacing: 2)]
    
    var body: some View {
        let selectedColor: Color = Color(selectedColorName)
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 2.0) {
                ForEach(colors, id:\.self) { color in
                    if color == selectedColor {
                        LoweredRectangle(color: color)
                            .frame(width: 50, height: 50.0)
                    } else {
                        RaisedRectangle(color: color)
                            .frame(width: 50, height: 50)
                            .onTapGesture {
                                selectedColorName = color.name
                            }
                    }
                }
            }
        }.frame(maxHeight: 200)
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
