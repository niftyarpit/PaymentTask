//
//  FooterTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 10/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class FooterTableCell: UITableViewCell {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.FooterViewModel) {
        displayLabel.text = model.text
    }

}
