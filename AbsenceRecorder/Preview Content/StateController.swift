//
//  StateController.swift
//  AbsenceRecorder
//
//  Created by Korniienko, Ivan (PGW) on 02/02/2023.
//

import Foundation
import UIKit

class StateController: ObservableObject {
    @Published var divisions: [Division] = []
    
    init() {
        loadFromFile()
    }
    
    func loadFromFile() {
        if let loaded: [Division] = FileManager.default.load(from: "divisions.json") {
            divisions = loaded
        }
    }
    
    func saveToFile() {
        FileManager.default.save(to: "divisions.json", object: divisions)
        
    }
}
