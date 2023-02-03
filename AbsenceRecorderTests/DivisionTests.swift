//
//  DivisionTests.swift
//  AbsenceRecorderTests
//
//  Created by Korniienko, Ivan (PGW) on 02/02/2023.
//

import XCTest
@testable import AbsenceRecorder

class DivisionTests: XCTestCase {


    func testGetAbsenceDivisionWithAbsenceOnThatDayReturnsAbsence() throws {
        //arrange
        let division = Division(code: "TestDiv")
        let dateToday = Date()
        let absence = Absence(date: dateToday, students: Student.examples)
        division.absences.append(absence)

        //act
        let actual = division.getAbsence(for: dateToday)

        //assert
        XCTAssertNotNil(actual)

    }
    func testGetAbsenceDivisionWithAbsenceOnLaterDayReturnsAbsence() throws {
        //arrange
        let division = Division(code: "TestDiv")
        let dateLaterToday = Date(timeIntervalSinceNow: 10000000000000000000)
        let absence = Absence(date: dateLaterToday, students: Student.examples)
        division.absences.append(absence)

        //act
        let actual = division.getAbsence(for: dateLaterToday)

        //assert
        XCTAssertNotNil(actual)

    }
    func testGetAbsenceDivisionWithAbsenceOnTomorrowDayReturnsAbsence() throws {
        //arrange
        let division = Division(code: "TestDiv")
        let dateToday = Date()
        let tomorrowToday = Date(timeIntervalSinceNow: 1000000000000000000000000000)
        let absence1 = Absence(date: dateToday, students: Student.examples)
        let absence2 = Absence(date: tomorrowToday, students: Student.examples)
        division.absences.append(absence1)
        division.absences.append(absence2)
        
        //act
        let actual = division.getAbsence(for: tomorrowToday)
        
        //assert
        XCTAssertNotNil(actual)
        if let actualNotNil = actual {
            XCTAssertEqual(actualNotNil.takenOn, absence2.takenOn)
        }
        
    }


}
