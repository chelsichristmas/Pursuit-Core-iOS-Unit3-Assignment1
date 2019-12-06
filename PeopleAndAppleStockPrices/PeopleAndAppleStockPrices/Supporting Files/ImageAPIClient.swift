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
class ImageAPIClient {
    static let manager = ImageAPIClient()
    
    func getImage(from urlString: String, completionHandler: @escaping (Result<UIImage,AppError>) -> Void) {
        
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidURL))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {( data, error, response)
            
            if let data = data {
                let image = UIImage(data: data)
            } else { completionHandler(.failure(.noData))
                return
            }
            
            if let error = error {
                completionHandler(.failure(.networkClientError))
                
            }
            
            if let response = response {
                
            } else {
                completionHandler(.failure(.respnseError))
            }
        }
    }
//    //func getImage(from urlStr: String,
//                  completionHanlder: @escaping (Result<UIImage, AppError>) -> Void) {
//
//        guard let url = URL(string: urlStr) else {
//            completionHanlder(.failure(.badURL))
//            return
//        }
//
//        NetworkHelper.manager.getData(from: url) { (result) in
//            switch result {
//            case let .failure(error):
//                completionHanlder(.failure(error))
//            case let .success(data):
//                guard let onlineImage = UIImage(data: data) else {
//                    completionHanlder(.failure(.notAnImage))
//                    return
//                }
//                completionHanlder(.success(onlineImage))
//            }
//        }
//    }
    
    private init() {}
}
