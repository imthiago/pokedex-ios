//
//  Model.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 31/01/21.
//

import Foundation

protocol Model: Codable, Equatable {

}

extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
