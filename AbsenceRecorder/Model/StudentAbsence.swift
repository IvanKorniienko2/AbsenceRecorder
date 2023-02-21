//
//  StudentAbsence.swift
//  AbsenceRecorder
//
//  Created by Korniienko, Ivan (PGW) on 02/02/2023.
//

import Foundation

class StudentAbsence: ObservableObject, Codable {
    let student: Student
    @Published var isAbsent: Bool
    
    init(student: Student) {
        self.student = student
        isAbsent = false
    }
    
    private enum CodingKeys: CodingKey {
        case student, isAbsent
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        student = try container.decode(Student.self, forKey: .student)
        isAbsent = try container.decode(Bool.self, forKey: .isAbsent)
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(student, forKey: .student)
        try container.encode(isAbsent forKey: .isAbsent)
    }
    
    #if DEBUG
    static let example = StudentAbsence(student: Student(forename: "Roberto", surname: "Baggio", birthday: Date()))
    #endif
}
