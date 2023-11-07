//
//  Response+JSONEntityMapper.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/29.
//

import Foundation
import Moya
import SwiftyJSON

public extension Response {

    func map<E: JSONEntity>(to type:E.Type) throws -> E {
        
        let jsonObject = try mapJSON()
        
        guard let mappedObject = E(JSON(jsonObject)) else {
            throw MoyaError.jsonMapping(self)
        }
        
        return mappedObject
    }

    func map<E: JSONEntity>(to type:[E.Type]) throws -> [E] {
        
        let jsonObject = try mapJSON()
        
        let mappedArray = JSON(jsonObject)
        let mappedObjectsArray = mappedArray.arrayValue.compactMap { E($0) }
        
        return mappedObjectsArray
    }
}
