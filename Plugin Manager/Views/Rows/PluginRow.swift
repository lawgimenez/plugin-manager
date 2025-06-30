//
//  PluginRow.swift
//  Plugin Manager
//
//  Created by Lawrence Gimenez on 6/30/25.
//

import SwiftUI

struct PluginRow: View {
    
    var plugin: Plugins.Plugin
    
    var body: some View {
        VStack(spacing: 12) {
            Group {
                Text(plugin.name)
                Text("Version: \(plugin.version)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}
