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
    
    var payButtonClickHandler: (Int, String) -> Void = {
        _, _ in
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        payButton.dropShadow()
        payButton.layer.cornerRadius = 5
        cvvTextField.dropShadow()
    }
    
    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.CardsViewModel.CardViewModel) {
        savedCardNumberLabel.text = model.number
        containerView.isHidden = !model.isExpanded
        payButton.tag = model.index
    }
    
    @IBAction func payButtonClicked(_ sender: UIButton) {
        guard let text = cvvTextField.text else { return }
        payButtonClickHandler(sender.tag, text)
    }
}

extension SavedCardTableCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 4
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
