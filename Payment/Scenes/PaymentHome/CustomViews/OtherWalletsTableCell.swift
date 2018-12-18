//
//  OtherWalletsTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 17/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class OtherWalletsTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var otherWallets: [PaymentHome.PaymentOptions.ViewModel.OtherWalletsViewModel.OtherWalletViewModel] = []
    
    var otherWalletClickHandler: (String) -> Void = {
        _ in
    }
    
    func configureCellWithModel(_ model: [PaymentHome.PaymentOptions.ViewModel.OtherWalletsViewModel.OtherWalletViewModel]) {
        otherWallets = model
        collectionView.reloadData()
    }
}

extension OtherWalletsTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return otherWallets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentHomeConstants.Values.IdentifierNames.OtherWalletCollectionCell,
                                                      for: indexPath) as! OtherWalletCollectionCell
        cell.configureCellWithModel(otherWallets[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let code = otherWallets[indexPath.row].code
        otherWalletClickHandler(code)
    }
}

extension OtherWalletsTableCell: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: frame.size.width/3-3, height: 98)
//    }
}

