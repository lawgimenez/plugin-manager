//
//  Plugins.swift
//  Plugin Manager
//
//  Created by Lawrence Gimenez on 6/30/25.
//

import Foundation

struct Plugins: Decodable {
    
    var plugins: [Plugin]
    var installStatus: [InstallStatus]
    
    enum CodingKeys: String, CodingKey {
        case plugins
        case installStatus = "install_status"
    }
    
    struct Plugin: Identifiable, Decodable {
        let id: Int
        let name: String
        let version: String
        let installStatus: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case version
            case installStatus = "install_status"
        }
    }
    
    struct InstallStatus: Identifiable, Codable {
        let id: Int
        let status: String
    }
}
