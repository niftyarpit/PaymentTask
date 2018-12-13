//
//  NetBanksInteractor.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 13/12/18.
//  Copyright (c) 2018 Arpit. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NetBanksBusinessLogic {
    func doSomething(request: NetBanks.Something.Request)
}

protocol NetBanksDataStore {
    //var name: String { get set }
}

class NetBanksInteractor: NetBanksBusinessLogic, NetBanksDataStore {
    var presenter: NetBanksPresentationLogic?
    var worker: NetBanksWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func doSomething(request: NetBanks.Something.Request) {
        worker = NetBanksWorker()
        worker?.doSomeWork()
        
        let response = NetBanks.Something.Response()
        presenter?.presentSomething(response: response)
    }
}