//
//  LinkWalletPresenter.swift
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

protocol LinkWalletPresentationLogic {
    func presentSomething(response: LinkWallet.Something.Response)
}

class LinkWalletPresenter: LinkWalletPresentationLogic {
    weak var viewController: LinkWalletDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: LinkWallet.Something.Response) {
        let viewModel = LinkWallet.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
