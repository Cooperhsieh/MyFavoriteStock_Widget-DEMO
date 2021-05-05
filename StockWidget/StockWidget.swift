//
//  StockWidget.swift
//  StockWidget
//
//  Created by Cooper on 2021/5/5.
//

import WidgetKit
import SwiftUI

struct StockWidgetEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var family


    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            StockSmallView(_stock: entry.stock.first!)

        case .systemMedium:
            StockMediumView(_stock: entry.stock)
            
        case .systemLarge:
            StockLargeView(_stock: entry.stock)

        default:
            fatalError()
        }
    }
}

@main
struct StockWidget: Widget {
    let kind: String = "StockWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            StockWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("我的自選")
        .description("自選股小工具")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}

struct StockWidget_Previews: PreviewProvider {
    static var previews: some View {
        StockWidgetEntryView(entry: StockEntry.mockTravelEntry())
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
