//
//  LoginEntity.swift
//  MVVMC
//
//  Created by sam on 2023/11/1.
//

import Foundation
import SwiftyJSON

struct LoginEntity: JSONEntity {
    
    init?(_ json: JSON) {
        nil
    }
}

struct CellDataEntity: Entity {
    let title: String
    let placeholder: String
    let tips: String
}
