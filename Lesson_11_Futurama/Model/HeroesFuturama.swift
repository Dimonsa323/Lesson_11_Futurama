//
//  HeroesFuturama.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 16.08.2022.
//

import Foundation


struct Futurama: Decodable {
    let species: String
    let age: String
    let planet: String
    let profession: String
    let status: String
    let firstAppearance: String
    let picURL: String
    let relatives, voicedBy, name: String

    enum CodingKeys: String, CodingKey {
        case species = "Species"
        case age = "Age"
        case planet = "Planet"
        case profession = "Profession"
        case status = "Status"
        case firstAppearance = "FirstAppearance"
        case picURL = "PicUrl"
        case relatives = "Relatives"
        case voicedBy = "VoicedBy"
        case name = "Name"
    }
}



