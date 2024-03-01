import SwiftUI

struct InitialView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundColor")
                
                Image("backgroundImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(0.6)
                
                VStack(spacing: 10) {
                    
                    Image("icon")
                    
                    Text("A Barata diz que tem")
                        .font(Font.customFont(size: 38))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white)
                    
                    HStack {
                        Text("3 páginas")
                        Text("2023")
                        Text("Quadrinhos")
                    }
                    .font(Font.customFont(size: 14))
                    .foregroundStyle(.white)
                    .padding(.top, 12)
                    
//                    NavigationLink {
//                        HistoryView(text: "Ajude a desmascarar as mentiras da barata numa dinâmica musical de jogo da memória onde você deve combinar os pares para desbloquear.")
//                    } label: {
//                        Image("startButton")
//                    }

                    Button {
                        print("teste")
                    } label: {
                        Image("startButton")
                    }
                    .padding(.top, 60)
                }
            }
            .ignoresSafeArea()
            
        }
    }
    
}
