//
//  File.swift
//  BreakingBad
//
//  Created by Dmitry on 09.05.2021.
//

import Foundation

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: URL, complition: @escaping(Data,URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) {data,respose,error in
            guard let data = data, let response = respose else {
                print(error?.localizedDescription ?? "")
                return
            }
            
            guard url == respose?.url else { return }
            
            DispatchQueue.main.async {
                complition(data, response)
            }
        }.resume()
    }
}
