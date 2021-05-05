//
//  StockLargeView.swift
//  StockWidgetExtension
//
//  Created by Cooper on 2021/5/5.
//

import SwiftUI
import WidgetKit

struct StockLargeView: View {
    private var stock: [Stock]
    
    init(_stock: [Stock]) {
        self.stock = _stock
    }

    
    var body: some View {
        VStack{
            ForEach(stock, id: \.id){ item in
                HStack
                {
                    Text("\(item.stockNumber)\n\(item.stockName)")
                        //display multiLine Text
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width:100, alignment: .leading)
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    
                   Spacer()
                    
                    Text("📈📈📈📈")
                        .frame(width:100, alignment: .trailing)
                        
                    

                    Text("\(item.price)\n\(item.changepct)")
                        .fixedSize(horizontal: false, vertical: true)
                        .frame(width:70, alignment: .trailing)
                        .font(.system(size: 14)).multilineTextAlignment(.trailing)
                        .foregroundColor(.white)
                        
                }
                Divider().background(Color.white)
                 
            }
        }
        
        .padding(EdgeInsets(top: 15, leading: 20, bottom: 0, trailing: 15))
        .background(Color.black)
    }
    
}


struct StockLargeView_Previews: PreviewProvider {
    static var previews: some View {
        
        StockLargeView(_stock: [Stock(id: 1, stockName: "台積電", stockNumber: "2330", price: "620", changepct: "3%", volume: "27131")])
            
            .previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}


