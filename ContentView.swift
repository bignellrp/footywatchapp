//
//  ContentView.swift
//  footywatch Watch App
//
//  Created by Rik Bignell on 30/04/2023.
//
import SwiftUI

//struct ContentView: View {
//    @State var teamacount: Int = 0
//    @State var teambcount: Int = 0
//    @State var playeracount: Int = 0
//    @State var playeracount0: Int = 0
//    @State var playeracount1: Int = 0
//    @State var playeracount2: Int = 0
//    @State var playeracount3: Int = 0
//    @State var playeracount4: Int = 0
//    @State var playerbcount: Int = 0
//    @State var listTeama: [String] = []
//    @State var listTeamb: [String] = []
//
//    var body: some View {
//        ScrollView {
//                    HStack(spacing: 20) {
//                        ScrollView {
//                            ForEach(listTeama, id: \.self) { player in
//                                Button(action:
//                                        {
//                                    self.teamacount += 1
//                                    self.playeracount += 1
//                                }
//                                )
//                                { Text("\(player) \(playerbcount)")}.buttonStyle(PlainButtonStyle())
//                            }
//                            Text("TeamA: \(teamacount)")
//                        }
//                        ScrollView {
//                            ForEach(listTeamb, id: \.self) { player in
//                                Button(action:
//                                        {
//                                    self.teambcount += 1
//                                    self.playerbcount += 1
//                                }
//                                )
//                                { Text("\(player) \(playerbcount)")}.buttonStyle(PlainButtonStyle())
//                            }
//                            Text("TeamB: \(teambcount)")
//                        }
//                    }
//                    .frame(maxWidth: .infinity)
//                }
//        .onAppear {
//            loadTeama()
//            loadTeamB()
//        }
//        Button(action: {
//            self.teamacount = 0
//            self.teambcount = 0
//            self.playeracount = 0
//            self.playerbcount = 0
//                })
//        {
//            Text("Reset")
//                }
//    }
//
//    func loadTeama() {
//            guard let url = URL(string: "https://footyappdev.richardbignell.co.uk/teama.txt") else {
//                return
//            }
//
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data else {
//                    return
//                }
//
//                if let fileContents = String(data: data, encoding: .utf8) {
//                    let lines = fileContents.components(separatedBy: "\n")
//                    self.listTeama = lines
//                }
//            }.resume()
//        }
//    func loadTeamB() {
//            guard let url = URL(string: "https://footyappdev.richardbignell.co.uk/teamb.txt") else {
//                return
//            }
//
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                guard let data = data else {
//                    return
//                }
//
//                if let fileContents = String(data: data, encoding: .utf8) {
//                    let lines = fileContents.components(separatedBy: "\n")
//                    self.listTeamb = lines
//                }
//            }.resume()
//        }
//}

struct Player {
    var name: String
}

struct ContentView: View {
    let playersA = [Player(name: "RB"), Player(name: "CB"), Player(name: "PB"), Player(name: "DS")]
    let playersB = [Player(name: "GH"), Player(name: "JD"), Player(name: "KE"), Player(name: "WQ")]
    @State var countsA = Array(repeating: 0, count: 5)
    @State var countsB = Array(repeating: 0, count: 5)
    @State var teamacount: Int = 0
    @State var teambcount: Int = 0

    var body: some View {
        HStack {
            List(playersA.indices, id: \.self) { index in
                HStack {
                    Text(playersA[index].name)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    Text("\(countsA[index])")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    Button(action: { countsA[index] += 1 }, label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.blue)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .font(.system(size: 12))
                    })
                    .frame(height: 19)
                }
            }
            List(playersB.indices, id: \.self) { index in
                HStack {
                    Text(playersB[index].name)
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    Text("\(countsB[index])")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                    Button(action: { countsB[index] += 1 }, label: {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.red)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .font(.system(size: 12))
                    })
                    .frame(height: 19)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
