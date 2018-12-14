//
//  CardInteractor.swift
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

protocol CardBusinessLogic {
    func doInitial(request: Card.Payment.Request)
    func validate(request: Card.Validation.Request)
}

protocol CardDataStore {
    var cardDetails: Card.CardDetails { get set }
}

class CardInteractor: CardBusinessLogic, CardDataStore {
    var presenter: CardPresentationLogic?
    var worker: CardWorker?
    var cardDetails = Card.CardDetails()
    var validation = Card.CardValidation()
    
    // MARK: Do Payment
    
    func doInitial(request: Card.Payment.Request) {
        cardDetails = request.cardDetails
        let response = Card.Payment.Response(cardDetails: request.cardDetails,
                                             cardValidation: validation)
        presenter?.presentInitial(response: response)
    }
    
    func validate(request: Card.Validation.Request) {
        cardDetails = request.cardDetails
        let validation = getValidation()
        let response = Card.Payment.Response(cardDetails: request.cardDetails,
                                             cardValidation: validation)
        presenter?.presentInitial(response: response)
    }
    
    // MARK: Private func
    
    private func getValidation() -> Card.CardValidation {
        if cardDetails.cardNumber != EMPTYSTRING {
            validation.cardNumberErrMessage = EMPTYSTRING
        } else {
            validation.cardNumberErrMessage = "Invalid Card Number"
        }
        if cardDetails.expiryDate != EMPTYSTRING {
            validation.validThroughErrMessage = EMPTYSTRING
        } else {
            validation.validThroughErrMessage = "Please select expiry"
        }
        if cardDetails.cvv != EMPTYSTRING {
            validation.cvvErrMessage = EMPTYSTRING
        } else {
            validation.cvvErrMessage = "Invalid CVV Number"
        }
        return validation
    }
}
