//
//  StockResource.swift
//  MyFavoriteStock
//
//  Created by Cooper on 2021/5/5.
//

import Foundation

protocol StockResourceProtocol {
    func getStockDetails(completionHandler: @escaping(_ result: StockResponse?)-> Void)
}

struct StockResource: StockResourceProtocol{
    func getStockDetails(completionHandler: @escaping (StockResponse?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://demo7432562.mockable.io/getmockstock")!)) { (responseData, urlResponse, serverError) in
            
            if(serverError == nil)
            {
                do {
                    let result = try JSONDecoder().decode(StockResponse.self, from: responseData!)
                    completionHandler(result)
                } catch  {
                    debugPrint(error)
                }
            }
        }.resume()
    }
    
}

