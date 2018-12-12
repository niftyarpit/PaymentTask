//
//  WalletTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 06/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class WalletTableCell: UITableViewCell {
    
    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!
    
    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.WalletsViewModel.WalletViewModel) {
        walletNameLabel.text = model.name
    }
}
