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
    private var previousTextFieldContent: String?
    private var previousSelection: UITextRange?
    
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
            if aModel.type == .cardNumber {
                var targetCursorPosition = 0
                if let startPosition = textField.selectedTextRange?.start {
                    targetCursorPosition = textField.offset(from: textField.beginningOfDocument, to: startPosition)
                }
                
                var cardNumberWithoutSpaces = ""
                if let text = textField.text {
                    cardNumberWithoutSpaces = self.removeNonDigits(string: text, andPreserveCursorPosition: &targetCursorPosition)
                }
                
                if cardNumberWithoutSpaces.count > 19 {
                    textField.text = previousTextFieldContent
                    textField.selectedTextRange = previousSelection
                    return
                }
                
                let cardNumberWithSpaces = self.insertCreditCardSpaces(cardNumberWithoutSpaces, preserveCursorPosition: &targetCursorPosition)
                textField.text = cardNumberWithSpaces
                
                if let targetPosition = textField.position(from: textField.beginningOfDocument, offset: targetCursorPosition) {
                    textField.selectedTextRange = textField.textRange(from: targetPosition, to: targetPosition)
                }
            }
            txtDidChangeHandler(aModel.type, textField.text ?? EMPTYSTRING)
        }
    }
    
    private func removeNonDigits(string: String, andPreserveCursorPosition cursorPosition: inout Int) -> String {
        var digitsOnlyString = ""
        let originalCursorPosition = cursorPosition
        
        for i in Swift.stride(from: 0, to: string.count, by: 1) {
            let characterToAdd = string[string.index(string.startIndex, offsetBy: i)]
            if characterToAdd >= "0" && characterToAdd <= "9" {
                digitsOnlyString.append(characterToAdd)
            }
            else if i < originalCursorPosition {
                cursorPosition -= 1
            }
        }
        
        return digitsOnlyString
    }
    
    private func insertCreditCardSpaces(_ string: String, preserveCursorPosition cursorPosition: inout Int) -> String {
        // Mapping of card prefix to pattern is taken from
        // https://baymard.com/checkout-usability/credit-card-patterns
        
        // UATP cards have 4-5-6 (XXXX-XXXXX-XXXXXX) format
        let is456 = string.hasPrefix("1")
        
        // These prefixes reliably indicate either a 4-6-5 or 4-6-4 card. We treat all these
        // as 4-6-5-4 to err on the side of always letting the user type more digits.
        let is465 = [
            // Amex
            "34", "37",
            
            // Diners Club
            "300", "301", "302", "303", "304", "305", "309", "36", "38", "39"
            ].contains { string.hasPrefix($0) }
        
        // In all other cases, assume 4-4-4-4-3.
        // This won't always be correct; for instance, Maestro has 4-4-5 cards according
        // to https://baymard.com/checkout-usability/credit-card-patterns, but I don't
        // know what prefixes identify particular formats.
        let is4444 = !(is456 || is465)
        
        var stringWithAddedSpaces = ""
        let cursorPositionInSpacelessString = cursorPosition
        
        for i in 0..<string.count {
            let needs465Spacing = (is465 && (i == 4 || i == 10 || i == 15))
            let needs456Spacing = (is456 && (i == 4 || i == 9 || i == 15))
            let needs4444Spacing = (is4444 && i > 0 && (i % 4) == 0)
            
            if needs465Spacing || needs456Spacing || needs4444Spacing {
                stringWithAddedSpaces.append(" ")
                
                if i < cursorPositionInSpacelessString {
                    cursorPosition += 1
                }
            }
            
            let characterToAdd = string[string.index(string.startIndex, offsetBy:i)]
            stringWithAddedSpaces.append(characterToAdd)
        }
        
        return stringWithAddedSpaces
    }
}

extension CardPaymentTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        previousTextFieldContent = textField.text;
        previousSelection = textField.selectedTextRange;
        if let aModel = model, aModel.type == .cvv {
            guard let text = textField.text else { return true }
            let count = text.count + string.count - range.length
            return count <= 4
        }
        return true
    }
}
