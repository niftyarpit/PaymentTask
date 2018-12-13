//
//  CardPaymentPayTableViewCell.swift
//  Payment
//
//  Created by ANTONY RAPHEL on 13/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class CardPaymentPayTableViewCell: UITableViewCell {

    @IBOutlet weak var payButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        payButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with model:  Card.Payment.ViewModel.PayViewModel) {
        payButton.setTitle(model.title,
                           for: .normal)
    }

    @IBAction func didTapOnPay(_ sender: UIButton) {
        
    }
}
