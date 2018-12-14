//
//  NetBankTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 14/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class NetBankTableCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!

    func configureCellWithModel(_ model: NetBanks.List.ViewModel.BankInfoViewModel) {
        nameLabel.text = model.name
    }

}
