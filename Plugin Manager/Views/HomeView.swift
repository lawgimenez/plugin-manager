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
        VStack {
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            await pluginsObservable.parseData()
        }
    }
}

#Preview {
    HomeView()
}
