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
            catch InvalidInputError.exit {
                print("프로그램을 종료합니다...")
                return
            }
            catch {
                print(error)
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

