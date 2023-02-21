//
//  Division.swift
//  AbsenceRecorder
//
//  Created by Korniienko, Ivan (PGW) on 21/01/2023.
//

import Foundation


class Division: Codable {
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func getAbsence(for date: Date) -> Absence? {
        return absences.first {
            let comparison = Calendar.current.compare($0.takenOn, to: date, toGranularity: .day)
            return comparison == .orderedSame
        }
    }
    func createAbsenceOrGetExistingIfAvailable(for date: Date) -> Absence {
//if absence exists for the given date, return that date (getAbsence)
        if let existingAbsence = getAbsence(for: date) {
            return existingAbsence
        } else {
//otherwise, createa brand new date with this date passed in, using the current set of students
            let absence = Absence(date: date, students: students)
//add this to the absences array
            absences.append(absence)
//return the absence
            return absence
        }



    }
    
    
    #if DEBUG
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code)
        
        //loop as many times as parameters size says to create students and add them to the students property
        for i in 1 ... size {
            
            
            let student = Student(forename: "forename \(i)", surname: "surname \(i)", birthday: Date())
            division.students.append(student)
        }
            
            
        
        return division
    }
    
    static let examples = [Division.createDivision(code: "vBY-1", of: 8),
                           Division.createDivision(code: "vCX-1", of: 10),
                           Division.createDivision(code: "vE5-1", of: 16),
                           Division.createDivision(code: "vD1-1", of: 14)]
    

    
    #endif
    
}
