//
//  Hinario.swift
//  MBN
//
//  Created by Pedro henrique Dias hemmel de oliveira souza on 27/06/23.
//

import Foundation

struct Hinario: Codable {
    let hinarioId: Int
    let hinarioName: String
    let hinarioLyrics: [Paragraph]
}
