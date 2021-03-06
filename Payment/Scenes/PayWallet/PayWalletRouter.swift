//
//  PayWalletRouter.swift
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

@objc protocol PayWalletRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol PayWalletDataPassing {
    var dataStore: PayWalletDataStore? { get }
}

class PayWalletRouter: NSObject, PayWalletRoutingLogic, PayWalletDataPassing {
    weak var viewController: PayWalletViewController?
    var dataStore: PayWalletDataStore?
    
    // MARK: Routing
    
    //func routeToSomewhere(segue: UIStoryboardSegue?)
    //{
    //  if let segue = segue {
    //    let destinationVC = segue.destination as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //  } else {
    //    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //    let destinationVC = storyboard.instantiateViewController(withIdentifier: "SomewhereViewController") as! SomewhereViewController
    //    var destinationDS = destinationVC.router!.dataStore!
    //    passDataToSomewhere(source: dataStore!, destination: &destinationDS)
    //    navigateToSomewhere(source: viewController!, destination: destinationVC)
    //  }
    //}
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: PayWalletViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: PayWalletDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
