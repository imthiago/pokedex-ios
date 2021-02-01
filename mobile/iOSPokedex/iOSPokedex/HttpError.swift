//
//  HttpError.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 31/01/21.
//

import Foundation

enum HttpError: Error {
    case noConnectivity, badRequest, serverError
}
