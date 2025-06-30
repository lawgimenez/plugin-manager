//
//  HomeView.swift
//  Plugin Manager
//
//  Created by Lawrence Gimenez on 6/30/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pluginsObservable = PluginsObservable()
    
    var body: some View {
        NavigationStack {
            VStack {
                if let plugins = pluginsObservable.plugins {
                    List(plugins.plugins) { plugin in
                        PluginRow(plugin: plugin)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        
                    } label: {
                        Text("Sync")
                            .bold()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .task {
            await pluginsObservable.parseData()
        }
    }
}

#Preview {
    HomeView()
}
