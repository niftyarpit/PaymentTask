//
//  CardPresenter.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 12/12/18.
//  Copyright (c) 2018 Arpit. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CardPresentationLogic {
    func presentInitial(response: Card.Payment.Response)
}

class CardPresenter: CardPresentationLogic {
    weak var viewController: CardDisplayLogic?
    
    // MARK: Do Payment
    
    func presentInitial(response: Card.Payment.Response) {
        let itemsViewModel = getCellItemViewModel(response: response)
        let viewModel = Card.Payment.ViewModel(cellItems: itemsViewModel,
                                               shouldReload: response.cardDetails.shouldReload)
        viewController?.displayInitial(viewModel: viewModel)
    }
    
    private func getCellItemViewModel(response: Card.Payment.Response) -> [CardCellId] {
        var items: [CardCellId] = []
        items += [Card.Payment.ViewModel.CardPaymentViewModel(type: .cardNumber,
                                                              title: "CARD NUMBER",
                                                              placeHolder: "xxxx - xxxx - xxxx - xxxx",
                                                              text: response.cardDetails.cardNumber,
                                                              keybord: .decimalPad,
                                                              isErr: isValid(message: response.cardValidation.cardNumberErrMessage),
                                                              errMessage: response.cardValidation.cardNumberErrMessage)]
        items += [Card.Payment.ViewModel.CardPaymentViewModel(type: .validThrough,
                                                              title: "VALID THROUGH",
                                                              placeHolder: "MM / YY",
                                                              text: response.cardDetails.expiryDate,
                                                              keybord: .default,
                                                              isErr: isValid(message: response.cardValidation.validThroughErrMessage),
                                                              errMessage: response.cardValidation.validThroughErrMessage)]
        items += [Card.Payment.ViewModel.CardPaymentViewModel(type: .cvv,
                                                              title: "CVV",
                                                              placeHolder: "xxx",
                                                              text: response.cardDetails.cvv,
                                                              keybord: .decimalPad,
                                                              isErr: isValid(message: response.cardValidation.cvvErrMessage),
                                                              errMessage: response.cardValidation.cvvErrMessage)]
        items += [Card.Payment.ViewModel.SaveViewModel(type: .save,
                                                       title: "Save this card for quick checkout",
                                                       isChecked: response.cardDetails.isSaveChecked)]
        items += [Card.Payment.ViewModel.PayViewModel(type: .pay,
                                                      title: "Pay 345")]
        return items
    }
    
    private func isValid(message: String) -> Bool {
        return message == EMPTYSTRING ? false : true
    }
}
