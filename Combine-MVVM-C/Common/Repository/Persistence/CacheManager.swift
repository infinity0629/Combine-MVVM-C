//
//  CacheManager.swift
//  Combine-MVVM-C
//
//  Created by sam on 2023/10/27.
//

import Foundation
import Cache

public final class CacheManager {
    
    private let storage: Storage<String, Data>?
    
    public static let shared = CacheManager()
    
    private init() {
        
        let info = Bundle.main.infoDictionary
        let bundleIdentifier = info?["CFBundleIdentifier"] as? String ?? "com.infinity"
        let diskConfig = DiskConfig(name: "\(bundleIdentifier).cache")
        
        let memoryConfig = MemoryConfig()
        
        storage = try? Storage(diskConfig: diskConfig,
                               memoryConfig: memoryConfig,
                               transformer: TransformerFactory.forData())
    }
    
    public func set<ObjectType: Codable>(_ object: ObjectType, forKey key: String) {    
        let objectStoreage = storage?.transformCodable(ofType: ObjectType.self)
        try? objectStoreage?.setObject(object, forKey: key)
    }
    
    public func object<ObjectType: Codable>(forKey key: String, parseType: ObjectType.Type) -> ObjectType? {
        let objectStoreage = storage?.transformCodable(ofType: parseType)
        return try? objectStoreage?.object(forKey: key)
    }
    
    public func existsObject(forKey key: String) -> Bool {
        if let _ = try? storage?.existsObject(forKey: key) {
            return true
        }
        return false
    }
    
    public func removeObject(forKey key: String) {
        try? storage?.removeObject(forKey: key)
    }
    
    public func removeAll() {
      try? storage?.removeAll()
    }
}
