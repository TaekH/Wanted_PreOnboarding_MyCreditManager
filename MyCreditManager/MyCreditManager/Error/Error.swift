//
//  Error.swift
//  MyCreditManager
//
//  Created by 한택환 on 2023/05/02.
//

import Foundation

enum InvalidInputError: Error, CustomDebugStringConvertible {
    case invalidRunInput
    case invalidStudentName
    case missingStudentName(_ studentName: String)
    case studentNameAlreadyExists(_ studentName: String)
    case invalidInputFormat
    case exit
    
    var debugDescription: String {
        switch self {
        case .invalidRunInput:
            return "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."
        case .invalidStudentName:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        case .missingStudentName(let student):
            return "\(student) 학생을 찾지못했습니다."
        case .studentNameAlreadyExists(let student):
            return "\(student)은 이미 존재하는 학생입니다. 추가하지 않습니다."
        case .invalidInputFormat:
            return "입력이 잘못되었습니다. 다시 확인해주세요."
        case .exit:
            return "오류로 인해 프로그램을 종료합니다..."
        }
    }
}
