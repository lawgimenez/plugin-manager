//
//  PluginRow.swift
//  Plugin Manager
//
//  Created by Lawrence Gimenez on 6/30/25.
//

import SwiftUI

struct PluginRow: View {
    
    @Environment(PluginsObservable.self) private var pluginsObservable
    var plugin: Plugins.Plugin
    
    var body: some View {
        VStack(spacing: 12) {
            Group {
                HStack {
                    Text(plugin.name)
                        .bold()
                        .font(.system(size: 14))
                    if let status = pluginsObservable.getInstallStatus(id: plugin.installStatus) {
                        Text(status)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(.gray, lineWidth: 1.5)
                            )
                    }
                }
                Text("Version: \(plugin.version)")
                Button {
                    
                } label: {
                    HStack {
                        Text("Details")
                    }
                    .padding(8)
                }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: Color(.black).opacity(0.1), radius: 3, x: 0, y: 4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
    }
}
