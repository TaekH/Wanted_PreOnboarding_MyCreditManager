//
//  main.swift
//  MyCreditManager
//
//  Created by 한택환 on 2023/04/27.
//

import Foundation

final class CreditManager {
    static let shared = CreditManager()
    
    private init() { }
    
    var studentDatas = [String: [String: String]]()

    func switchGrade(_ grade: String) -> Double {
        switch grade {
        case "A+":
            return 4.5
        case "A":
            return 4.0
        case "B+":
            return 3.5
        case "B":
            return 3.0
        case "C+":
            return 2.5
        case "C":
            return 2.0
        case "D+":
            return 1.5
        case "D":
            return 1.0
        case "F":
            return 0.0
        default :
            print("학점이 잘못되었습니다.")
            return 0.0
        }
    }

    func isValidStudentName(_ name: String) -> Bool {
        return name.allSatisfy( { $0.isLetter }) || name == "" ? true : false
    }

    func isValidInput(_ input: [String], _ idx: Int) -> Bool {
        return input.count == idx ? true : false
    }

    func checkExistingStudent(_ name: String) -> Bool {
        return studentDatas[name] != nil ? true : false
    }

    func addStudent() throws {
        print("추가할 학생의 이름을 입력해주세요")
        let student = readLine()!
        if !isValidStudentName(student) {
            throw InvalidInputError.invalidStudentName
        } else if checkExistingStudent(student) {
            throw InvalidInputError.studentNameAlreadyExists(student)
        }
        studentDatas[student] = [:]
        print("\(student)학생을 추가했습니다.")
    }

    func deleteStudent() throws {
        print("삭제할 학생의 이름을 입력해주세요")
        let student = readLine()!
        if !isValidStudentName(student) {
            throw InvalidInputError.invalidStudentName
        }
        if !checkExistingStudent(student) {
            throw InvalidInputError.missingStudentName(student)
        }
        studentDatas[student] = nil
        print("\(student)학생을 삭제하였습니다.")
    }

    func addGrade() throws {
        print("성적을 추가할 학생의 이름,과목 이름,성적(A+,A,F등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력 예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존점수가 갱신됩니다.")
        let input = readLine()!.split(separator: " ").map { String($0) }
        if !isValidInput(input, 3) {
            throw InvalidInputError.invalidInputFormat
        }
        if !checkExistingStudent(input[0]) {
            throw InvalidInputError.missingStudentName(input[0])
        }
        studentDatas[input[0]]?[input[1]] = input[2]
        print("\(input[0])학생의 \(input[1]) 과목이 \(input[2])로 추가(변경)되었습니다.")
    }

    func deleteGrade() throws {
        print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
        let input = readLine()!.split(separator: " ").map { String($0) }
        if !isValidInput(input, 2) {
            throw InvalidInputError.invalidInputFormat
        }
        if !checkExistingStudent(input[0]) {
            throw InvalidInputError.missingStudentName(input[0])
        }
        studentDatas[input[0]]?[input[1]] = nil
        print("\(input[0])학생의 \(input[1]) 과목이 삭제되었습니다.")
    }

    func getGpa() throws {
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        let student = readLine()!
        if !isValidStudentName(student) {
            throw InvalidInputError.invalidStudentName
        }
        if !checkExistingStudent(student) {
            throw InvalidInputError.missingStudentName(student)
        }
        guard let student = studentDatas[student] else { return }
        var average = 0.0
        for grade in student {
            print("\(grade.key): \(grade.value)")
            average += switchGrade(grade.value)
        }
        print(String(format: "%.2f", (average/Double(student.count))))
    }

}
