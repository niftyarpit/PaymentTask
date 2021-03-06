//
//  NetBanksViewController.swift
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

protocol NetBanksDisplayLogic: class {
    func displayList(viewModel: NetBanks.List.ViewModel)
}

class NetBanksViewController: UIViewController, NetBanksDisplayLogic {
    var interactor: NetBanksBusinessLogic?
    var router: (NSObjectProtocol & NetBanksRoutingLogic & NetBanksDataPassing)?
    @IBOutlet weak var tableView: UITableView!
    var bankNames: [NetBanks.List.ViewModel.BankInfoViewModel] = []
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = NetBanksInteractor()
        let presenter = NetBanksPresenter()
        let router = NetBanksRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchList()
        navigationItem.title = "Net Banking"
    }
    
    func fetchList() {
        let request = NetBanks.List.Request()
        interactor?.fetchList(request: request)
    }
    
    func displayList(viewModel: NetBanks.List.ViewModel) {
        bankNames = viewModel.banks
        tableView.reloadData()
    }
}

extension NetBanksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let lCell = tableView.dequeueReusableCell(withIdentifier: "NetBankTableCell",
                                                  for: indexPath) as! NetBankTableCell
        lCell.configureCellWithModel(bankNames[indexPath.row])
        cell = lCell
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows = bankNames.count
        return rows
    }
}

extension NetBanksViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let height: CGFloat = 5
        return height
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let height: CGFloat = CGFloat.leastNonzeroMagnitude
        return height
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(bankNames[indexPath.row].name)
    }
}
