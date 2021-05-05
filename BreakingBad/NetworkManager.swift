//
//  NetworkManager.swift
//  BreakingBad
//
//  Created by Dmitry on 05.05.2021.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchData(with complition: @escaping([Char])->Void) {
        let url = "https://breakingbadapi.com/api/characters/"
        var chars: [Char] = []
        
        AF.request(url)
            .validate()
            .responseJSON { dataRespose in
                switch dataRespose.result {
                case .success(let value):
                    chars = Char.getCharaters(from: value)
                    DispatchQueue.main.async {
                        complition(chars)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    private init() {}
}

