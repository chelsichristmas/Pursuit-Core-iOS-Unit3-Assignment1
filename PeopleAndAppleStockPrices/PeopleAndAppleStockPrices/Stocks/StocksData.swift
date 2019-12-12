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
    var close: Double
    var open: Double
    var label: String
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
    
    
    
    static func sectionStocks() -> [[StocksData]] {
        
        
        let stocks = StocksData.getStocks()
        //let sortedStocks = stocks.sorted{ $0.date > $1.date}
        
        var stockDateArray = [String]()
        

        for stock in stocks {

            var newDate = stock.date.components(separatedBy: "-")
            newDate.removeLast()
            let finalDate = newDate.joined(separator: " ")
            stockDateArray.append(finalDate)
        }
        
        let uniqueDates = Set(stockDateArray)
        var sections = Array(repeating: [StocksData](), count: uniqueDates.count)
        var currentIndex = 0
        var sectionDate = uniqueDates.sorted{$0 < $1}.first
        
        for stock in stocks {
            var newDate = stock.date.components(separatedBy: "-")
            newDate.removeLast()
            let finalDate = newDate.joined(separator: " ")
            
            if finalDate == sectionDate {
                sections[currentIndex].append(stock)
            } else {
                currentIndex += 1
                sectionDate = finalDate
                sections[currentIndex].append(stock)
            }
            
        }
            
    return sections
        }
   
}





