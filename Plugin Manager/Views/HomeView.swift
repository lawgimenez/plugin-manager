//
//  HomeView.swift
//  Plugin Manager
//
//  Created by Lawrence Gimenez on 6/30/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var pluginsObservable = PluginsObservable()
    @State private var isPresentSyncingProgress = false
    @State private var timerCount = 0
    @State private var timer = Timer.publish(every: 0, on: .main, in: .common).autoconnect()
    private let timerLimit = 4
    
    var body: some View {
        NavigationStack {
            VStack {
                if isPresentSyncingProgress {
                    ProgressView()
                        .padding()
                }
                if let plugins = pluginsObservable.plugins {
                    List(plugins.plugins) { plugin in
                        PluginRow(plugin: plugin)
                            .environment(pluginsObservable)
                            
                            .listRowSeparator(.hidden)
                    }
                    .scrollContentBackground(.hidden)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.khakiDark), Color(.khakiPrimary)]), startPoint: .top, endPoint: .bottom))
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isPresentSyncingProgress = true
                        timer.upstream.connect().cancel()
                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                    } label: {
                        Text("Sync")
                            .padding([.leading, .trailing], 15)
                            .bold()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.khakiDark), Color(.khakiPrimary)]), startPoint: .top, endPoint: .bottom))
        }
        .task {
            await pluginsObservable.parseData()
        }
        .onReceive(timer) { input in
            print("Timer: \(input)")
            if timerCount < timerLimit {
                timerCount += 1
            }
            if timerCount == timerLimit {
                timer.upstream.connect().cancel()
                isPresentSyncingProgress = false
            }
        }
    }
}

#Preview {
    HomeView()
}
