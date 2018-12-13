//
//  ConstantsHelper.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 07/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import Foundation

let EMPTYSTRING = ""

enum PaymentHomeConstants {
    enum Values {
        enum IdentifierNames {
            static let HeaderTableCell = "HeaderTableCell"
            static let FooterTableCell = "FooterTableCell"
            static let UPITableCell = "UPITableCell"
            static let SavedCardTableCell = "SavedCardTableCell"
            static let WalletTableCell = "WalletTableCell"
            static let NetBanksTableCell = "NetBanksTableCell"
            static let NetBankCollectionCell = "NetBankCollectionCell"
        }
    }
    enum Keys {
        static let custom = "custom"
        static let alert_info = "alert_info"
        static let alert_error = "alert_error"
        static let card = "card"
        static let netbanking = "netbanking"
        static let upi = "upi"
        static let enabled = "enabled"
        static let pg = "pg"
        static let saved = "saved"
        static let number = "number"
        static let preferred = "preferred"
        enum Preferred {
            static let priority = "priority"
            static let logo = "logo"
            static let code = "code"
            static let name = "name"
        }
        static let all = "all"
        static let wallet = "wallet"
        enum Wallet {
            static let name = "name"
            static let code = "code"
            static let logo = "logo"
            static let linking_enabled = "linking_enabled"
        }
    }
}

enum CardPaymentConstants {
    enum Values {
        enum IdentifierNames {
            static let CardPaymentTableCell = "CardPaymentTableViewCell"
            static let SaveTableCell = "CardPaymentSaveTableViewCell"
            static let PayTableCell = "CardPaymentPayTableViewCell"
        }
    }
}

