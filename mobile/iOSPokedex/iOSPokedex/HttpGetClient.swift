//
//  APIClient.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 31/01/21.
//

import Foundation

protocol HttpGetClient {
    func get(to url: URL, with params: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
