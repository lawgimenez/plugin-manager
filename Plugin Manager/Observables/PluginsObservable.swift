//
//  PluginsObservable.swift
//  Plugin Manager
//
//  Created by Lawrence Gimenez on 6/30/25.
//

import SwiftUI

@Observable
class PluginsObservable {
    
    var plugins: Plugins?
    
    func parseData() async {
        guard let url = Bundle.main.url(forResource: "plugins.json", withExtension: nil) else {
            fatalError("Cannot load JSON file")
        }
        if let data = try? Data(contentsOf: url) {
            self.plugins = try? JSONDecoder().decode(Plugins.self, from: data)
        }
    }
    
    func getInstallStatus(id: Int) -> String? {
        guard let plugins else { return nil }
        guard let installStatus = plugins.installStatus.first(where: {
            $0.id == id
        }) else { return nil }
        return installStatus.status
    }
}
