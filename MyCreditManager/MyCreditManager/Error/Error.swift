//
//  Error.swift
//  MyCreditManager
//
//  Created by 한택환 on 2023/05/02.
//

import Foundation

enum InvalidInputError: Error {
    case invalidRunInput
    case invalidStudentName
    case missingStudentName(_ studentName: String)
    case studentNameAlreadyExists(_ studentName: String)
    case invalidInputFormat
    case exit
}
