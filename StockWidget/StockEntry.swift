//
//  StockEntry.swift
//  StockWidgetExtension
//
//  Created by Cooper on 2021/5/5.
//

import WidgetKit

struct StockEntry: TimelineEntry {
    let date: Date
    let stock : [Stock]

    static func mockTravelEntry() -> StockEntry{
        return StockEntry(date: Date(), stock: [Stock(id: 1, stockName: "台積電", stockNumber: "2330", price: "620", changepct: "5%", volume: "11247")])
    }

}

