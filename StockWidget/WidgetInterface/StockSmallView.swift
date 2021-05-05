//
//  StockSmallView.swift
//  StockWidgetExtension
//
//  Created by Cooper on 2021/5/5.
//

import SwiftUI
import WidgetKit

struct StockSmallView: View {
    
    private var stock: Stock
    
    init(_stock: Stock) {
        self.stock = _stock
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing:8) {
            HStack {
                Text("\(stock.stockName) \(stock.stockNumber)")
                    .font(Font.headline)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding(.all)
            .background(Color.orange)
            
            
            Text("成交價：\(stock.price) 元")
                .padding(.horizontal, 10)
                .font(.system(size: 15))
                .foregroundColor(Color.white)
            
            Text("漲跌幅：\(stock.changepct)")
                .padding(.horizontal, 10)
                .font(.system(size: 15))
                .foregroundColor(Color.white)
            
            Text("成交量：\(stock.volume)")
                .padding(.horizontal, 10)
                .font(.system(size: 15))
                .foregroundColor(Color.white)
            
            Spacer()
            
        }
        .background(Color.black)
        
    }
}

struct StockSmallView_Previews: PreviewProvider {
    static var previews: some View {
        StockSmallView(_stock: Stock(id: 1, stockName: "台積電", stockNumber: "2330", price: "602", changepct: "5%", volume: "21387"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
