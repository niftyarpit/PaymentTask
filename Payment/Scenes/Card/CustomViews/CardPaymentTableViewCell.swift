//
//  CardPaymentTableViewCell.swift
//  Payment
//
//  Created by ANTONY RAPHEL on 13/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class CardPaymentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var txtField: UITextField!
    
    var datePickerHandler: (String) -> Void = { _ in
    }
    var txtFieldDoneHandler: () -> Void = {}
    var txtDidChangeHandler: (CardCellType, String) -> Void = { _, _ in
    }
    
    private lazy var expiryDatePicker = MonthYearPickerView()
    private var model: Card.Payment.ViewModel.CardPaymentViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 5
        txtField.delegate = self
        setToolbar()
        txtField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(with model: Card.Payment.ViewModel.CardPaymentViewModel) {
        self.model = model
        if model.isErr {
            containerView.dropShadow(color: UIColor(red: 242/255, green: 100/242, blue: 26/255, alpha: 1.0),
                                     opacity: 1.0)
        } else {
            containerView.dropShadow()
        }
        titleLabel.text = model.title
        errorLabel.text = model.errMessage
        txtField.placeholder = model.placeHolder
        txtField.keyboardType = model.keybord
        txtField.text = model.text
        txtField.isSecureTextEntry = model.type == .cvv ? true : false
        if model.keybord == .default {
            txtField.inputView = expiryDatePicker
            expiryDatePicker.onDateSelected = { [weak self] (month: Int, year: Int) in
                guard let strongSelf = self else { return }
                let string = String(format: "%02d / %d", month, year)
                strongSelf.datePickerHandler(string)
                strongSelf.txtField.text = string
            }
        }
    }
    
    private func setToolbar() {
        let toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapOnDone))]
        toolBar.sizeToFit()
        txtField.inputAccessoryView = toolBar
    }
    
    @objc private func didTapOnDone() {
        //Done
        txtFieldDoneHandler()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let aModel = model {
            //            if aModel.type == .cardNumber {
            //                txtField.text = modify(cardNumber: textField.text ?? EMPTYSTRING)
            //            }
            txtDidChangeHandler(aModel.type, textField.text ?? EMPTYSTRING)
        }
    }
    
    //    private func modify(cardNumber: String) -> String {
    //        let trimmedString = cardNumber.components(separatedBy: .whitespaces).joined()
    //        let arrOfCharacters = Array(trimmedString.characters)
    //        var modifiedcardNumber = EMPTYSTRING
    //        if(arrOfCharacters.count > 0) {
    //            for i in 0...arrOfCharacters.count-1 {
    //                modifiedcardNumber.append(arrOfCharacters[i])
    //                if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count) {
    //                    modifiedcardNumber.append(" - ")
    //                }
    //            }
    //        }
    //        return modifiedcardNumber
    //    }
}

extension CardPaymentTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let aModel = model {
            txtDidChangeHandler(aModel.type, textField.text ?? EMPTYSTRING)
        }
    }
    
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    //        if let aModel = model, aModel.type == .cardNumber {
    //            guard string.characters.compactMap({ Int(String($0)) }).count ==
    //                string.characters.count else { return false }
    //
    //            let text = textField.text ?? ""
    //
    //            if string.characters.count == 0 {
    //                textField.text = String(text.characters.dropLast()).chunkFormatted()
    //            }
    //            else {
    //                let newText = String((text + string).characters
    //                    .filter({ $0 != " - " }).prefix(maxNumberOfCharacters))
    //                textField.text = newText.chunkFormatted()
    //            }
    //            return false
    //        }
    //        return true
    //    }
}
