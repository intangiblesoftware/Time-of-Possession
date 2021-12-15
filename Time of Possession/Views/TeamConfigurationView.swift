//
//  TeamConfigurationView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 12/13/21.
//

import SwiftUI

struct TeamConfigurationView: View {
    @ObservedObject var configuration: Configuration
    
    var body: some View {
        VStack {
            HeadingText(heading: "Team name")
            TextField("Team name", text: $configuration.name, prompt: Text("Team name"))
                .padding(8.0)
                .foregroundColor(Color("instructionText"))
                .background(Color("background"))
                .cornerRadius(10.0)
                .padding([.leading, .trailing])
            HeadingText(heading: "Team color")
            ColorPicker(selectedColorName: $configuration.colorName)
                .padding([.leading, .trailing, .bottom])
        }
        .background(Color(configuration.colorName))
        .padding()
    }
}

struct ColorPicker: View {
    @Binding var selectedColorName: String
    
    private let colors: [Color] = Constants.TeamColors.allTeamColors
    private let columns = [GridItem(.adaptive(minimum: 45, maximum: 55), spacing: 10.0)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 10.0) {
                ForEach(colors, id:\.self) { color in
                    Rectangle()
                        .foregroundColor(color)
                        .frame(width: 50, height: 50)
                        .border(color.name == selectedColorName ? Color.white : Color.clear)
                        .onTapGesture {
                            selectedColorName = color.name
                        }
                }
            }.padding(.horizontal, 2.0)
        }.frame(maxHeight: 200)
    }
}

struct HeadingText: View {
    var heading: String
    
    var body: some View {
        Text(heading)
            .font(.headline)
            .foregroundColor(Color("buttonText"))
            .padding([.top, .leading])
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TeamConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TeamConfigurationView(configuration: Configuration(for: .home))
                .previewLayout(.sizeThatFits)
            TeamConfigurationView(configuration: Configuration(for: .home))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
