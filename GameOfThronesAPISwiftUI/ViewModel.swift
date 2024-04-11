import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    //variável para armazenamento dos dados obtidos pela API
    @Published var character: [Character] = []
    
    // Função para realizar a requisição da API
    func fetch(){
        
        //guard let para  garantir que se não houver uma URL ou se ela for inválida, a função dará um return vazio
        guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else {return}
        
        
        //???????
        //shared é um singleton -> pode ser acessado de qualquer parte do app
        //faz a requisição dos dados da API seguindo o link, armazena os dados na variavel data e decodifica do formato da struct [Character]
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            //guard let para verificar se a 'data'obtida é válida, caso contrário um return vazio é dado, saindo do escopo da função
            guard let data = data, error == nil else {return}
            
            //Convert to JSON
            do {
                let character = try JSONDecoder().decode([Character].self, from: data)
                
                //Coloca a alteração da array character na tread principal, tornando a tarefa prioritária pois ela afeta diferamente a view
                DispatchQueue.main.async {
                    self?.character = character
                }
            } catch {
                print(error)
            }
        }
        
        //inicia a execuçãp da tarefa
        task.resume()
        
    }
    
    func houseBeforeHouseName(houseName: String) -> String{
        let houseName = houseName
        let words = houseName.split(separator: " ")
        let firstWord = words.first
        
        if firstWord == "House"{
            return houseName
        } else{
            let newHouseName = "House \(houseName)"
            return newHouseName
        }
    }
}
