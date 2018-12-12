//
//  PaymentHomePresenter.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 03/12/18.
//  Copyright (c) 2018 Arpit. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PaymentHomePresentationLogic {
    func presentPaymentOptions(response: PaymentHome.PaymentOptions.Response)
}

class PaymentHomePresenter: PaymentHomePresentationLogic {
    weak var viewController: PaymentHomeDisplayLogic?
    
    // MARK: Do something
    
    func presentPaymentOptions(response: PaymentHome.PaymentOptions.Response) {
        let viewModel = getViewModel(from: response)
        viewController?.displayPaymentOptions(viewModel: viewModel)
    }
    
    private func getViewModel(from response: PaymentHome.PaymentOptions.Response) -> PaymentHome.PaymentOptions.ViewModel {
        var summary: [Identifiable] = []
        if let upi = response.upi {
            summary += [PaymentHome.PaymentOptions.ViewModel.UPIViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.UPITableCell)]
        }
        if let card = response.card {
            summary += [PaymentHome.PaymentOptions.ViewModel.HeaderViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.HeaderTableCell,
                                                                             text: "Saved Cards")]
            var cards: [PaymentHome.PaymentOptions.ViewModel.CardsViewModel.CardViewModel] = []
            for lCard in card.cards {
                cards += [PaymentHome.PaymentOptions.ViewModel.CardsViewModel.CardViewModel(imageUrl: lCard.logo,
                                                                                            number: lCard.number)]
            }
            summary += [PaymentHome.PaymentOptions.ViewModel.CardsViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.SavedCardsSection,
                                                                            cards: cards)]
            summary += [PaymentHome.PaymentOptions.ViewModel.FooterViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.FooterTableCell,
                                                                             text: "Debit / Credit Card Payment")]
        }
        summary += [PaymentHome.PaymentOptions.ViewModel.HeaderViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.HeaderTableCell,
                                                                         text: "Wallets")]
        var wallets: [PaymentHome.PaymentOptions.ViewModel.WalletsViewModel.WalletViewModel] = []
        for aWallet in response.wallet {
            wallets += [PaymentHome.PaymentOptions.ViewModel.WalletsViewModel.WalletViewModel(imageUrl: aWallet.logo,
                                                                                              code: aWallet.code,
                                                                                              name: aWallet.name)]
        }
        summary += [PaymentHome.PaymentOptions.ViewModel.WalletsViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.WalletsSection,
                                                                          wallets: wallets)]
        if let netbanking = response.netbanking {
            summary += [PaymentHome.PaymentOptions.ViewModel.HeaderViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.HeaderTableCell,
                                                                             text: "Net Banking")]
            var banks: [PaymentHome.PaymentOptions.ViewModel.PreferredBanksViewModel.PreferredBankViewModel] = []
            for preferred in netbanking.preferred {
                banks += [PaymentHome.PaymentOptions.ViewModel.PreferredBanksViewModel.PreferredBankViewModel(imageUrl: preferred.logo,
                                                                                                              code: preferred.code,
                                                                                                              name: preferred.name)]
            }
            summary += [PaymentHome.PaymentOptions.ViewModel.PreferredBanksViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.NetBanksTableCell,
                                                                                     banks: banks)]
            summary += [PaymentHome.PaymentOptions.ViewModel.FooterViewModel(identifier: PaymentHomeConstants.Values.IdentifierNames.FooterTableCell,
                                                                             text: "More Banks")]
            
        }
        let viewModel = PaymentHome.PaymentOptions.ViewModel(summary: summary)
        return viewModel
    }
    
    
}