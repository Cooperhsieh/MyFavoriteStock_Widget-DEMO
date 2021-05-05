//
//  Provider.swift
//  StockWidgetExtension
//
//  Created by Cooper on 2021/5/5.
//

import WidgetKit

struct Provider: TimelineProvider {
    let loader: StockResource = StockResource()
    typealias Entry = StockEntry
    
    func placeholder(in context: Context) -> StockEntry {
        StockEntry.mockTravelEntry()
    }
    
    func getSnapshot(in context: Context, completion: @escaping (StockEntry) -> ()) {
        let entry = StockEntry.mockTravelEntry()
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        
        loader.getStockDetails { (response) in
            if(response != nil && response?.result != nil)
            {
                let currentDate = Date()
                let entry = StockEntry(date: currentDate, stock: (response?.result)!)
                let refreshDate = Calendar.current.date(byAdding: .minute, value: 60, to: currentDate)!
                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
                completion(timeline)
            }
        }
    }
}
