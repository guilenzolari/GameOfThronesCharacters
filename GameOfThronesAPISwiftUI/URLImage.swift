//
//  URLImage.swift
//  GameOfThronesAPISwiftUI
//
//  Created by Guilherme Ferreira Lenzolari on 02/03/24.
//

import SwiftUI

struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .background(Color.gray)
                .clipShape(Circle())
        } else {
            Image(systemName: "video")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .background(Color.gray)
                .clipShape(Circle())
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
