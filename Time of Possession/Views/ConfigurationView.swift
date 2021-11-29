//
//  ConfigurationView.swift
//  Time of Possession
//
//  Created by Jim Dabrowski on 11/11/21.
//

import SwiftUI

struct ConfigurationView: View {
    @State private var homeTeamName: String = ""
    @State private var homeTeamColor: Color = .green

    @State private var visitingTeamName: String = ""
    @State private var visitingTeamColor: Color = .red
    
    private let colors: [Color] = [Color.blue, Color.brown, Color.cyan, Color.gray, Color.green, Color.indigo, Color.mint, Color.orange, Color.pink, Color.purple, Color.red, Color.teal, Color.yellow]
    private let columns = [GridItem(.flexible(minimum: 50.0, maximum: .infinity), spacing: 10.0),
                           GridItem(.flexible(minimum: 50.0, maximum: .infinity), spacing: 10.0),
                           GridItem(.flexible(minimum: 50.0, maximum: .infinity), spacing: 10.0),
                           GridItem(.flexible(minimum: 50.0, maximum: .infinity), spacing: 10.0),
                           GridItem(.flexible(minimum: 50.0, maximum: .infinity), spacing: 10.0)]
    
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
                        
                    } label: {
                        Text("Done")
                    }
                    .padding([.top, .trailing])

                }
                Form {
                    Section {
                        TextField("Home team name", text: $homeTeamName, prompt: Text("Team name"))
                            LazyVGrid(columns: columns, content: {
                                ForEach(colors, id:\.self) { color in
                                    Rectangle()
                                        .foregroundColor(color)
                                        .frame(width: 50, height: 50)
                                }
                            }).frame(maxHeight: 200)
                    } header: {
                        Text("Home Team")
                    }
                    Section {
                        TextField("Visiting team name ", text: $visitingTeamName, prompt: Text("Team name"))
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(colors, id:\.self) { color in
                                    Rectangle()
                                        .foregroundColor(color)
                                        .frame(width: 50, height: 50)
                                }
                            }
                        }
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

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
