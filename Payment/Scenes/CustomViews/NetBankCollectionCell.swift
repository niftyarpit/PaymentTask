//
//  NetBankCollectionCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 07/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class NetBankCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var bankImageView: UIImageView!
    @IBOutlet weak var bankNameLabel: UILabel!
    
    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.PreferredBanksViewModel.PreferredBankViewModel) {
        bankNameLabel.text = model.name
    }

}
