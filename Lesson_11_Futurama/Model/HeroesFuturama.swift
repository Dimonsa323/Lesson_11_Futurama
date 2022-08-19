//
//  HeroesFuturama.swift
//  Lesson_11_Futurama
//
//  Created by Дима Губеня on 16.08.2022.
//

import Foundation


struct Futurama: Decodable {
    let species: Species
    let age: String
    let planet: Planet
    let profession: String
    let status: Status
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

enum Planet: String, Decodable {
    case earth = "Earth"
    case unknown = "Unknown"
}

enum Species: String, Decodable {
    case formerlyHumanCurrentlyHeadInJarPossibly = "Formerly: HumanCurrently: Head in Jar (possibly)"
    case human = "Human"
    case humanClone = "Human/Clone"
    case unknown = "Unknown"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case aliveLivesInUniverseGamma = "Alive (lives in Universe Gamma)"
    case deceased = "Deceased"
    case unknown = "Unknown"
}


