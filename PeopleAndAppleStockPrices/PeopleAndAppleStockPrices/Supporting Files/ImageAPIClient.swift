//
//  ImageAPIClient.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit
enum AppError: Error {
    case noData(Error)
    case invalidURL(String)
    case networkClientError
    case responseError(Error)
    
    
}


// getting API Image using URLSession
// clarifying question about the function returning void (Is it because the function finishes running before we retrieve the image?)
struct ImageAPIClient {
    
    static func findImage(for urlString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("error: \(error)")
            }
            
            if let data = data {
                let image = UIImage(data: data)
                
                completion(.success(image!))
            }
        }
        dataTask.resume()
    }
}
