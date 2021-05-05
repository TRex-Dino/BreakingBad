//
//  Character.swift
//  BreakingBad
//
//  Created by Dmitry on 05.05.2021.
//

import Foundation


struct Char {

    let char_id: Int?
    let name: String?
    let birthday: String?
    let occupation: [String]?
    let img: String?
    let status: String?
//    let appearance: [Int]?
    let nickname: String?
//    let portrayed: String
    let category: String?
    
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name = "name"
        case birthday = "birthday"
        case occupation = "occupation"
        case img = "img"
        case status = "status"
        case nickname = "nickname"
        case category = "category"
    }
    
    init(char: [String: Any]) {
        char_id = char["char_id"] as? Int
        name = char["name"] as? String
        birthday = char["birthday"] as? String
        occupation = char["occupation"] as? [String]
        img = char["img"] as? String
        status = char["status"] as? String
        nickname = char["nickname"] as? String
        category = char["category"] as? String
    }
    
    static func getCharaters(from value: Any) -> [Char] {
        var chars: [Char] = []
        guard let chartsData = value as? [[String: Any]] else { return [] }
        for chartData in chartsData {
            let char = Char(char: chartData)
            chars.append(char)
        }
        return chars
    }
}
