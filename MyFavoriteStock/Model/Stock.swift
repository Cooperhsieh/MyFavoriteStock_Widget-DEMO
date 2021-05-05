//
//  Stock.swift
//  MyFavoriteStock
//
//  Created by Cooper on 2021/5/5.
//

import Foundation

struct StockResponse: Codable
{
    let result: [Stock]?
}

struct Stock: Codable {
    let id: Int
    //商品
    let stockName: String
    //代號
    let stockNumber: String
    //成交價
    let price: String
    //漲跌幅
    let changepct: String
    //交易數量
    let volume: String
}
