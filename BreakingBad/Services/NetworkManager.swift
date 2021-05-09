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
    
    func fetchData(with complition: @escaping([Character])->Void) {
        let url = "https://breakingbadapi.com/api/characters/"
        
        AF.request(url)
            .validate()
            .responseJSON { dataRespose in
                switch dataRespose.result {
                case .success(let value):
                    let chars = Character.getCharaters(from: value)
                    DispatchQueue.main.async {
                        complition(chars)
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func fetchImageData(from url: String, with complition: @escaping(UIImage?)->Void) {
        AF.request(url)
            .validate()
            .responseData { responseData in
                switch responseData.result {
                case .success(let value):
                    DispatchQueue.main.async {
                        complition(UIImage(data: value))
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func fetchImage() -> Data? {
        let url = "https://breakingbadapi.com/api/characters/"
        
        guard let imageURL = URL(string: url) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
    
    private init() {}
}

