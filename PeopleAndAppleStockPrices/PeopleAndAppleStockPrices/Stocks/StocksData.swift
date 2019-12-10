//
//  StocksInformation.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct StocksData: Decodable{
    var date: String
    var open: Double
}

extension StocksData {
    static func getStocks() -> [StocksData] {
        var stocks = [StocksData]()
        guard let fileURL = Bundle.main.url(forResource: "stockInfo", withExtension: "json") else {
            fatalError("Unable to retrieve json file")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            let stocksData =  try JSONDecoder().decode([StocksData].self, from: data)
            stocks = stocksData
            
        } catch {
            fatalError("\(error)")
            
        }
        return stocks
    }
}


