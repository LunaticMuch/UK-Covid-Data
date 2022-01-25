//
//  UK_Covid_DataApp.swift
//  UK Covid Data
//
//  Created by Stefano Cislaghi on 09/01/2022.
//

import SwiftUI

@main
struct UKCovidDataApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.line.uptrend.xyaxis")
                }

            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
        }
    }
}
