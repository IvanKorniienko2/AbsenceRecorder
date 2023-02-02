//
//  StatisticsView.swift
//  AbsenceRecorder
//
//  Created by Korniienko, Ivan (PGW) on 02/02/2023.
//

import Foundation
import SwiftUI

struct StatisticsView: View {
    @EnvironmentObject var state: StateController
    
    var body: some View {
        Text("Statistics: \(state.divisions[0].code)")
    }
    
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
