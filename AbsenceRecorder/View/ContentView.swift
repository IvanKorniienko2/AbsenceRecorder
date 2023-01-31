//
//  ContentView.swift
//  AbsenceRecorder
//
//  Created by Korniienko, Ivan (PGW) on 21/01/2023.
//

import SwiftUI



struct ContentView: View {
    var division: [Division]
    
    
    var body: some View {
        Text("Code: \(division[0].code)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(division: Division.examples)
    }
}
