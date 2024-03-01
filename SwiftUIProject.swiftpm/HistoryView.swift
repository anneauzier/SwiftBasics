//
//  HistoryView.swift
//  SwiftUIProject
//
//  Created by Anne Auzier on 01/03/24.
//

import SwiftUI
import AVFoundation

struct HistoryView: View {
    let text: String
    let images = ["barataFalando1", "barataFalando2"]
    
    @State private var animatedText = ""
    @State var currentIndex = 0
    
    @State var isAnimating: Bool = true
    
    @State var audioPlayer: AVAudioPlayer?
    
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
            
            Image("backgroundImage")
                .resizable()
            
            VStack {
                Image(images[currentIndex])
                    .resizable()
                    .frame(width: 195, height: 195)
                    .padding(.bottom, 65)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { _ in
                            withAnimation {
                                if isAnimating {
                                    self.currentIndex = (self.currentIndex + 1) % self.images.count
                                }
                            }
                        }
                        playAudio()
                    }
                
                Image("rectangle")
                    .resizable()
                    .frame(width: 348, height: 205)
                    .overlay {
                        Text(animatedText)
                            .multilineTextAlignment(.center)
                            .font(.headline)
                            .padding()
                            .foregroundStyle(Color("backgroundColor"))
                            .task {
                                await animate()
                                isAnimating = false
                            }
                    }
            }
        }.ignoresSafeArea()
    }
    
    private func animate() async {
        for char in text {
            animatedText.append(char)
            try! await Task.sleep(for: .milliseconds(75))
        }
    }
    
    func playAudio() {
        let resourcePath = Bundle.main.url(forResource: "talkingSF", withExtension: "mp3")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: resourcePath!)
            // audioPlayer?.numberOfLoops = 1
            audioPlayer?.play()
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    HistoryView(text: "Ajude a desmascarar as mentiras da barata numa dinâmica musical de jogo da memória onde você deve combinar os pares para desbloquear.")
}
