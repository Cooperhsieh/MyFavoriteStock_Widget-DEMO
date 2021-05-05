//
//  StockListViewController.swift
//  MyFavoriteStock
//
//  Created by Cooper on 2021/5/5.
//
import Foundation
import UIKit

class StockListViewController: UIViewController {
    
    @IBOutlet weak var stockTableView: UITableView!
    
    private var resource: StockResourceProtocol = StockResource()
    var stockDetails:[Stock] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的自選股"
        resource.getStockDetails { (response) in
            if(response != nil && response?.result != nil)
            {
                self.stockDetails = response?.result ?? []
                DispatchQueue.main.async {
                    self.stockTableView.reloadData()
                }
            }
        }
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension StockListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.stockDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StockTableViewCell") as! StockTableViewCell
        let data = self.stockDetails[indexPath.row]
        
        cell.label_stockName.text = data.stockName
        cell.label_stockNumber.text = "商品代號：\(data.stockNumber)"
        cell.label_price.text = "成交價：\(data.price) 元"
        cell.label_changepct.text = "漲跌幅：\(data.changepct)"
        cell.label_volume.text = "成交量：\(data.volume)"

        return cell
    }
}
