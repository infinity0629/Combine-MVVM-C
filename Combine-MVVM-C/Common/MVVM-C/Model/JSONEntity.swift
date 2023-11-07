//
//  JSONEntity.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/27.
//

import Foundation
import SwiftyJSON

public protocol JSONEntity: Entity {
    init?(_ json: JSON)
}
