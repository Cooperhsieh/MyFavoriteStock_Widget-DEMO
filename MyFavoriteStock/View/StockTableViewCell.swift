//
//  StockTableViewCell.swift
//  MyFavoriteStock
//
//  Created by Cooper on 2021/5/5.
//

import UIKit

class StockTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView! {
        didSet{
            cardView.layer.cornerRadius = 5.0
            cardView.layer.shadowColor = UIColor.gray.cgColor
            cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            cardView.layer.shadowRadius = 3.0
            cardView.layer.shadowOpacity = 0.7
        }
    }
    
    @IBOutlet weak var label_stockName: UILabel!
    @IBOutlet weak var label_stockNumber: UILabel!
    @IBOutlet weak var label_price: UILabel!
    @IBOutlet weak var label_changepct: UILabel!
    @IBOutlet weak var label_volume: UILabel!
    

    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
