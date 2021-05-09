//
//  Character.swift
//  BreakingBad
//
//  Created by Dmitry on 05.05.2021.
//

import Foundation


struct Character {

    let char_id: Int?
    let name: String?
    let birthday: String?
    let occupation: [String]?
    let img: String?
    let status: String?
//    let appearance: [Int]?
    let nickname: String?
    let portrayed: String?
    let category: String?
    
    init(char: [String: Any]) {
        char_id = char["char_id"] as? Int
        name = char["name"] as? String
        birthday = char["birthday"] as? String
        occupation = char["occupation"] as? [String]
        img = char["img"] as? String
        status = char["status"] as? String
        nickname = char["nickname"] as? String
        category = char["category"] as? String
        portrayed = char["portrayed"] as? String
    }
    
    static func getCharaters(from value: Any) -> [Character] {
        var chars: [Character] = []
        
        guard let chartsData = value as? [[String: Any]] else { return [] }
        
        for chartData in chartsData {
            let char = Character(char: chartData)
            chars.append(char)
        }
        return chars
    }
}
