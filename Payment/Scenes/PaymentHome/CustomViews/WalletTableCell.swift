//
//  WalletTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 06/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

enum Wallet {
    case paytm
    case amazonpay
    case mobikwik
    case olamoney
    case freecharge
    case payzapp
    case mpesa
}

class WalletTableCell: UITableViewCell {
    
    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var walletAmountLabel: UILabel!
    
    private var code = EMPTYSTRING
    
    var linkButtonClickHandler: (String) -> Void = {
        _ in
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCellWithModel(_ model: PaymentHome.PaymentOptions.ViewModel.WalletsViewModel.WalletViewModel) {
        walletNameLabel.text = model.name
        linkButton.isHidden = !model.isLinked
        walletAmountLabel.isHidden = model.isLinked
        code = model.code
    }
    
    @IBAction func linkButtonClicked(_ sender: UIButton) {
        linkButtonClickHandler(code)
    }
    
//    private func getWalletType(for code: String) -> Wallet {
//        var retVal: Wallet = .paytm
//        switch code {
//        case "paytm":
//            retVal = .paytm
//        case "amazonpay":
//            retVal = .amazonpay
//        case "mobikwik":
//            retVal = .mobikwik
//        case "olamoney":
//            retVal = .olamoney
//        case "freecharge":
//            retVal = .freecharge
//        case "payzapp":
//            retVal = .payzapp
//        case "mpesa":
//            retVal = .mpesa
//        default:
//            break
//        }
//        return retVal
//    }
}
