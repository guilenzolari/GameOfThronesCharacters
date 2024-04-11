//
//  CharacterDetailView.swift
//  GameOfThronesAPISwiftUI
//
//  Created by Guilherme Ferreira Lenzolari on 03/03/24.
//

import SwiftUI

struct CharacterDetailView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var house: String
    @Binding var title: String
    
    
    var body: some View {
        VStack() {
            Text("Daenaerys")
                .font(.title)
            
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200)
                .background(Color.gray)
                .clipShape(Circle())
            
            Text("House Targerian")
                .font(.system(size: 15))
                      
            Text("Mother of Dragons")
                        
        }
    }
}

//#Preview {
//    CharacterDetailView(firstName: <#Binding<String>#>, lastName: <#Binding<String>#>, house: <#Binding<String>#>, title: <#Binding<String>#>)
//}
