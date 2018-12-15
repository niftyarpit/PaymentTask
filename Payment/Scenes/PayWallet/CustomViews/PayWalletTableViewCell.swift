//
//  PayWalletTableViewCell.swift
//  Payment
//
//  Created by ANTONY RAPHEL on 15/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class PayWalletTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(with model: PayWallet.Info.ViewModel.WalletViewModel) {
        titleLabel.text = model.title
        amountLabel.text = model.amount
    }
}
