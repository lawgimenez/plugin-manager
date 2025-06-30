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
    @State private var isPresentDetails = false
    
    var body: some View {
        VStack(spacing: 12) {
            Group {
                HStack {
                    Text(plugin.name)
                        .bold()
                        .font(.system(size: 18))
                    if let status = pluginsObservable.getInstallStatus(id: plugin.installStatus) {
                        Text(status)
                            .padding(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color(.khakiBorder), lineWidth: 1.5)
                            )
                    }
                }
                Text("Version: \(plugin.version)")
                Button {
                    isPresentDetails = true
                } label: {
                    Text("Details")
                    .padding(8)
                }
                .buttonStyle(.borderedProminent)
                .tint(LinearGradient(gradient: Gradient(colors: [Color(.khakiDark), Color(.khakiPrimary)]), startPoint: .top, endPoint: .bottom))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 4, y: 4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .sheet(isPresented: $isPresentDetails) {
            VStack(spacing: 8) {
                Text(plugin.name)
                    .bold()
                    .font(.system(size: 14))
                Text("Version: \(plugin.version)")
                Button {
                    isPresentDetails = false
                } label: {
                    Text("Close")
                        .padding(8)
                }
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .shadow(color: Color(.black).opacity(0.2), radius: 3, x: 4, y: 4)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
    }
}
