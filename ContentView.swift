//
//  ContentView.swift
//  footywatch Watch App
//
//  Created by Rik Bignell on 30/04/2023.
//
import SwiftUI

struct ContentView: View {
    @State var teamacount: Int = 0
    @State var teambcount: Int = 0
    @State var playeracount: Int = 0
    @State var playeracount0: Int = 0
    @State var playeracount1: Int = 0
    @State var playeracount2: Int = 0
    @State var playeracount3: Int = 0
    @State var playeracount4: Int = 0
    @State var playerbcount: Int = 0
    
    @State var listTeama: [String] = []
    @State var listTeamb: [String] = []
    
    var body: some View {
        ScrollView {
                    HStack(spacing: 20) {
                        ScrollView {
//                            ForEach(listTeama, id: \.self) { player in
                            ForEach(Array(listTeama.enumerated()), id: \.1) { index, player in
                                Button(action:
                                        {
                                    self.teamacount += 1
                                    let num = "playeraacount\(index)"
                                    self.playeracount += 1
                                }
                                )
                                    {
                                    Text("\(player): \(index)")
                                }.buttonStyle(PlainButtonStyle())
                            }
                            Text("TeamA: \(teamacount)")
                        }
                        ScrollView {
                            ForEach(listTeamb, id: \.self) { player in
                                Button(action:
                                        {
                                    self.teambcount += 1
                                    self.playerbcount += 1
                                }
                                )
                                { Text("\(player) \(playerbcount)")}.buttonStyle(PlainButtonStyle())
                            }
                            Text("TeamB: \(teambcount)")
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
        .onAppear {
            loadTeama()
            loadTeamB()
        }
        Button(action: {
            self.teamacount = 0
            self.teambcount = 0
            self.playeracount = 0
            self.playerbcount = 0
                })
        {
            Text("Reset")
                }
    }
    
    func loadTeama() {
            guard let url = URL(string: "https://footyappdev.richardbignell.co.uk/teama.txt") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    return
                }
                
                if let fileContents = String(data: data, encoding: .utf8) {
                    let lines = fileContents.components(separatedBy: "\n")
                    self.listTeama = lines
                }
            }.resume()
        }
    func loadTeamB() {
            guard let url = URL(string: "https://footyappdev.richardbignell.co.uk/teamb.txt") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    return
                }
                
                if let fileContents = String(data: data, encoding: .utf8) {
                    let lines = fileContents.components(separatedBy: "\n")
                    self.listTeamb = lines
                }
            }.resume()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
