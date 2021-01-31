//
//  Pokemon.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 31/01/21.
//

import Foundation

// MARK: - Pokemon
struct Pokemon: Model {
    let id: Int
    let name, pokemonDescription: String
    let image: String
    let genera, pokedexNumber: String
    let baseExperience: Int
    let types: [Abilite]
    let stats: [Stat]
    let height, weight: Int
    let abilites: [Abilite]
    let genderRate: Int
    let eggGroups: [Abilite]

    enum CodingKeys: String, CodingKey {
        case id, name
        case pokemonDescription = "description"
        case image, genera
        case pokedexNumber = "pokedex_number"
        case baseExperience = "base_experience"
        case types, stats, height, weight, abilites
        case genderRate = "gender_rate"
        case eggGroups = "egg_groups"
    }
}

// MARK: - Abilite
struct Abilite: Model {
    let name: String
    let url: String
}

// MARK: - Stat
struct Stat: Model {
    let baseStat: Int
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case name, url
    }
}
