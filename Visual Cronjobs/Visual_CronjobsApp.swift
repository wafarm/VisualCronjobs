//
//  Visual_CronjobsApp.swift
//  Visual Cronjobs
//
//  Created by qinyuyao on 6/10/22.
//

import SwiftUI

@main
struct Visual_CronjobsApp: App {
    private let (status, cronJobs) = getCronJobs()
    var body: some Scene {
        WindowGroup {
            if status {
                ContentView(jobs: cronJobs)
            }
        }
    }
}
