//
//  PayWalletPresenter.swift
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

protocol PayWalletPresentationLogic {
    func presentSomething(response: PayWallet.Something.Response)
}

class PayWalletPresenter: PayWalletPresentationLogic {
    weak var viewController: PayWalletDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: PayWallet.Something.Response) {
        let viewModel = PayWallet.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}