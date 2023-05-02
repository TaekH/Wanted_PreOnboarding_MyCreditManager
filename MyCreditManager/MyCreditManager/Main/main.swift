//
//  main.swift
//  MyCreditManager
//
//  Created by 한택환 on 2023/05/02.
//

import Foundation

Main().runCreditManager()

final class Main {
    let creditManager = CreditManager.shared
    
    func selectManagerOption(_ input: String) throws {
        if let input = Function(rawValue: input) {
            switch input {
            case .addStudent:
                try creditManager.addStudent()
            case .deleteStudent:
                try creditManager.deleteStudent()
            case .addGrade:
                try creditManager.addGrade()
            case .deleteGrade:
                try creditManager.deleteGrade()
            case .getGpa:
                try creditManager.getGpa()
            case .exit:
                throw InvalidInputError.exit
            }
        } else {
            throw InvalidInputError.invalidRunInput
        }
    }
    
    func runCreditManager() {
        while true {
            do {
                print("원하는 기능을 입력해주세요")
                print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
                
                try selectManagerOption(readLine()!)
            }
            catch InvalidInputError.invalidRunInput {
                print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            }
            catch InvalidInputError.exit {
                print("프로그램을 종료합니다...")
                return
            }
            catch InvalidInputError.invalidStudentName {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            catch InvalidInputError.invalidInputFormat {
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }
            catch InvalidInputError.missingStudentName(let student) {
                print("\(student) 학생을 찾지못했습니다.")
            }
            catch InvalidInputError.studentNameAlreadyExists(let student) {
                print("\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
            }
            catch {
                print("오류로 인해 프로그램을 종료합니다...")
                return
            }
        }
    }
}

enum Function: String {
    case addStudent = "1"
    case deleteStudent = "2"
    case addGrade = "3"
    case deleteGrade = "4"
    case getGpa = "5"
    case exit = "X"
}
