//
//  PrimitiveSequence+JSONEntityMapper.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/29.
//

import Foundation
import Combine
import Moya
import SwiftyJSON

public extension AnyPublisher where Output == Response, Failure == MoyaError {
    
    func map<E: JSONEntity>(to type: E.Type) -> AnyPublisher<E, MoyaError> {
        unwrapThrowable { response in
            try response.map(to: type)
        }
    }
    
    func map<E: JSONEntity>(to type: [E.Type]) -> AnyPublisher<[E], MoyaError> {
        unwrapThrowable { response in
            try response.map(to: type)
        }
    }
    
    private func unwrapThrowable<T>(throwable: @escaping (Output) throws -> T) -> AnyPublisher<T, MoyaError> {
        tryMap { response in
            try throwable(response)
        }
        .mapError { error -> MoyaError in
            if let moyaError = error as? MoyaError {
                return moyaError
            } else {
                return .underlying(error, nil)
            }
        }
        .eraseToAnyPublisher()
    }
}
