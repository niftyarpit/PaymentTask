//
//  OtherWalletCollectionCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 17/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class OtherWalletCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!

    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.OtherWalletsViewModel.OtherWalletViewModel) {
        walletNameLabel.text = model.name
    }

}

