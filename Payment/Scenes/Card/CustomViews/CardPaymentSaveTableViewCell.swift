//
//  CardPaymentSaveTableViewCell.swift
//  Payment
//
//  Created by ANTONY RAPHEL on 13/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class CardPaymentSaveTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkButton.dropShadow()
        checkButton.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(with model:  Card.Payment.ViewModel.SaveViewModel) {
        titleLabel.text = model.title
        checkButton.isSelected = model.isChecked
    }
    
    @IBAction func didTapOnCheck(_ sender: UIButton) {
        
    }
}
