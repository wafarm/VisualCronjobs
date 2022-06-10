//
//  ContentView.swift
//  Visual Cronjobs
//
//  Created by qinyuyao on 6/10/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedJob: String? = nil;
    
    var testData = [
        "A item",
        "Another item",
        "Third item"
    ]
    
    var body: some View {
        HStack {
            List(testData, id: \.self, selection: $selectedJob) { name in
                Text(name)
            }.frame(width: 200, height: 300)
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
