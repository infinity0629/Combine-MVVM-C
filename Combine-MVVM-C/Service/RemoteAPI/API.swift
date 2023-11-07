//
//  API.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/22.
//

import Foundation
import MoyaSugar

enum API {
    case home
    case products
    case product(id: String)
    case login(userName: String, password: String)
    case logout
}

extension API: SugarTargetType {
    
    var baseURL: URL {
        URL(string: "")!
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var route: Route {
        switch self {
        case .home:
            return .get("")
        case .products:
            return .get("")
        case .product(let id):
            return .get("/product/id=\(id)")
        case .login:
            return .post("")
        case .logout:
            return .post("")
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let userName, let password):
            return JSONEncoding() => [
                "userName": userName,
                "password": password
            ]
        default:
            return nil
        }
    }    
}
