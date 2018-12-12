//
//  ViewController.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 03/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigator()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonClicked(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Payment",
                              bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PaymentHomeViewController") as! PaymentHomeViewController
        navigationController?.pushViewController(vc,
                                                 animated: true)

    }
    
    private func configureNavigator() {
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController.navigationBar.sizeToFit()
    }

}

