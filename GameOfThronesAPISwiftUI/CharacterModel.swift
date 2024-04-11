//
//  Character.swift
//  GameOfThronesAPISwiftUI
//
//  Created by Guilherme Ferreira Lenzolari on 01/03/24.
//

import Foundation

struct Character: Hashable, Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let title: String
    let family: String
    let imageUrl: String
}

/*
    Codable = Encodable + Decodable
isso significa que o objeto pode ser convertido ou desconvertido de um formato de dados externo como JSON.
 
 Codable = transforma em JSON
 Decodable = converte de volta para a representação original
 */

