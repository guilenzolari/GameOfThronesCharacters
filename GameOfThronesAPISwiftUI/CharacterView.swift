//
//  ContentView.swift
//  GameOfThronesAPISwiftUI
//
//  Created by Guilherme Ferreira Lenzolari on 01/03/24.
//

import SwiftUI

struct CharacterView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.character, id: \.self){character in
                    HStack{
                        VStack(alignment: .leading) {
                            HStack{
                                Text(character.firstName)
                                Text(character.lastName)
                                    .foregroundColor(.gray)
                            }.bold()
                            
                            Text(viewModel.houseBeforeHouseName(houseName: character.family))
                                .font(.system(size: 14))
                            
                            Text(character.title)
                                .font(.system(size: 14))
                                .italic()
                        }
                        
                        Spacer()
                        
                        URLImage(urlString: character.imageUrl)
                    }.padding(.horizontal, 16)
                    
                }
                
            }.navigationTitle("Characters")
                .onAppear{
                    viewModel.fetch()}
        }
    }
}

#Preview {
    CharacterView()
}
