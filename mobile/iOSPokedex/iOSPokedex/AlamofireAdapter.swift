//
//  AlamofireAdapter.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 31/01/21.
//

import Foundation
import Alamofire

final class AlamofireAdapter: HttpGetClient {
    private let session: Session

    init(session: Session = .default) {
        self.session = session
    }

    func get(to url: URL, with params: Data?, completion: @escaping (Result<Data?, HttpError>) -> Void) {
        session.request(url, method: .get, parameters: params?.toJson(), encoding: JSONEncoding.default).responseData { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else {
                return completion(.failure(.noConnectivity))
            }
            switch dataResponse.result {
            case .failure:
                completion(.failure(.noConnectivity))
            case .success(let data):
                switch statusCode {
                case 204:
                    completion(.success(nil))
                case 200...209:
                    completion(.success(data))
                case 400...499:
                    completion(.failure(.badRequest))
                case 500...599:
                    completion(.failure(.serverError))
                default:
                    completion(.failure(.noConnectivity))
                }
            }
        }
    }
}
