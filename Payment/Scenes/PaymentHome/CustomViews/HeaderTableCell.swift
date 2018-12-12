//
//  HeaderTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 10/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class HeaderTableCell: UITableViewCell {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.HeaderViewModel) {
        displayLabel.text = model.text
    }

}
