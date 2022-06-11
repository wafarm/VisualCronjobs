//
//  ContentView.swift
//  Visual Cronjobs
//
//  Created by qinyuyao on 6/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedJob: CronJob? = nil
    @State var jobs: [CronJob] = [CronJob.fromString("* * * * * test command", id: 0)];
    
    var body: some View {
        HStack {
            List(jobs, id: \.self, selection: $selectedJob) { job in
                Text(job.name)
            }.frame(width: 200, height: 300)
            if $selectedJob.wrappedValue != nil {
                JobEditorView(selectedJob: selectedJob!)
            } else {
                Text("Please select a job.").frame(width: 400, height: 300)
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
