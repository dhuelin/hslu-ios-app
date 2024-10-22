//
//  TicTacToeLevelView.swift
//  Levels
//
//  Created by Matthias Felix on 13.10.2023.
//

import SwiftUI


struct TicTacToeLevel: Level {

    let id: String = "levels.felix.tictactoe"
    let title: String = "Tic-Tac-Toe"
    let author: String = "Matthias"
    let description: String = "X oder O?"
    let titleImage: Image = Image(ImageResource.levelImage4)

    // List of all winning coordinate-tuples (x, y)
    private let winningCoordinates = [
        // horizontal
        [(0, 0), (0, 1), (0, 2)],
        [(1, 0), (1, 1), (1, 2)],
        [(2, 0), (2, 1), (2, 2)],

        // vertical
        [(0, 0), (1, 0), (2, 0)],
        [(0, 1), (1, 1), (2, 1)],
        [(0, 2), (1, 2), (2, 2)],

        // diagonal
        [(0, 0), (1, 1), (2, 2)],
        [(0, 2), (1, 1), (2, 0)],
    ]

    // 0 means no entry, 1 means 'X', 2 means 'O'
    @State private var gridState: [[Int]] = [
        [0, 0, 0],
        [0, 0, 0],
        [0, 0, 0],
    ]

    @State private var currentPlayer = 1
    @State private var winningPlayer = 0
    
    @EnvironmentObject var levelState: LevelState
    
    var body: some View {
        VStack {
            Grid {
                ForEach(0..<3) { x in
                    GridRow {
                        ForEach(0..<3) { y in
                            Color.black.opacity(0.1)
                                .aspectRatio(1, contentMode: .fit) // This makes the rectangle a square
                                .onTapGesture {
                                    // Only react to the tap if no player has won yet and the grid square is empty
                                    guard winningPlayer == 0, gridState[x][y] == 0 else { return }

                                    withAnimation {
                                        gridState[x][y] = currentPlayer
                                    }

                                    currentPlayer = currentPlayer == 1 ? 2 : 1

                                    checkForWin()
                                }
                                .border(.black)
                                .overlay {
                                    if gridState[x][y] == 1 {
                                        Text("X")
                                            .foregroundStyle(.blue)
                                            .shadow(color: .blue, radius: 4)
                                            .font(.system(size: 60))
                                            .transition(.move(edge: .leading).combined(with: .opacity))
                                    } else if gridState[x][y] == 2 {
                                        Text("O")
                                            .foregroundStyle(.green)
                                            .shadow(color: .green, radius: 4)
                                            .font(.system(size: 60))
                                            .transition(.move(edge: .trailing).combined(with: .opacity))
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.bottom, 30)

            // Text and arrow showing which player's turn it is
            HStack {
                Text("Player X")
                    .foregroundStyle(.blue)
                    .shadow(color: .blue, radius: 4)
                    .background(alignment: .bottom) {
                        Color.black.frame(height: 2)
                            .scaleEffect(CGSize(width: currentPlayer == 1 ? 1 : 0, height: 1))
                    }
                Spacer()
                Image(systemName: "arrow.left")
                    .font(.system(size: 35))
                    .bold()
                    .rotationEffect(currentPlayer == 1 ? .zero : .degrees(180))
                Spacer()
                Text("Player O")
                    .foregroundStyle(.green)
                    .shadow(color: .green, radius: 4)
                    .background(alignment: .bottom) {
                        Color.black.frame(height: 2)
                            .scaleEffect(CGSize(width: currentPlayer == 2 ? 1 : 0, height: 1))
                    }
            }
            .font(.system(size: 30))
            .padding(.bottom, 30)

            // If there is a winning player, display text with an animated SF symbol
            if winningPlayer > 0 {
                let playerXWon = winningPlayer == 1
                levelState.finish(successful: true)

                HStack {
                    Text(playerXWon ? "Player X won!" : "Player O won!")
                        .font(.system(size: 30))
                        .bold()
                    Image(systemName: "fireworks")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.yellow, playerXWon ? Color.blue : Color.green)
                        .font(.system(size: 50))
                        .symbolEffect(.variableColor.reversing)
                }
                .transition(.scale.combined(with: .opacity))
            }

            Spacer()
        }
        .padding()
        .animation(.default, value: currentPlayer)
        .animation(.default, value: winningPlayer)
    }

    private func checkForWin() {
        // Go through each of the winning coordinates. If one is found
        // where all numbers are 1 or 2, the respective player has won.
        for coords in winningCoordinates {
            if coords.allSatisfy({ gridState[$0.0][$0.1] == 1 }) {
                winningPlayer = 1
                return
            } else if coords.allSatisfy({ gridState[$0.0][$0.1] == 2 }) {
                winningPlayer = 2
                return
            }
        }
    }
}

#Preview {
    TicTacToeLevel()
        .environmentObject(LevelState())
}
