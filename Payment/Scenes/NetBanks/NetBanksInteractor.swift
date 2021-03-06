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
    func fetchList(request: NetBanks.List.Request)
}

protocol NetBanksDataStore {
    var banksInfo: [String: Any] {get set}
}

class NetBanksInteractor: NetBanksBusinessLogic, NetBanksDataStore {
    var banksInfo: [String: Any] = [:]
    
    var presenter: NetBanksPresentationLogic?
    
    func fetchList(request: NetBanks.List.Request) {
        let response = getResponse(from: banksInfo)
        presenter?.presentList(response: response)
    }
    
    private func getResponse(from data: [String: Any]) -> NetBanks.List.Response {
        let banks = data.map { (key, value) in
            return NetBanks.List.Response.BankInfoResponse(code: key,
                                                           name: value as? String ?? EMPTYSTRING)
        }
        let response = NetBanks.List.Response(banks: banks)
        return response
    }
}
