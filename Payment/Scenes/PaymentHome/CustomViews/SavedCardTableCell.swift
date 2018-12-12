//
//  SavedCardTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 06/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class SavedCardTableCell: UITableViewCell {
    
    @IBOutlet weak var savedCardImageView: UIImageView!
    @IBOutlet weak var savedCardNumberLabel: UILabel!
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var cvvTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        payButton.dropShadow()
        payButton.layer.cornerRadius = 5
        cvvTextField.dropShadow()
    }
    
    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.CardsViewModel.CardViewModel) {
        savedCardNumberLabel.text = model.number
    }
}

extension SavedCardTableCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return true
    }
}