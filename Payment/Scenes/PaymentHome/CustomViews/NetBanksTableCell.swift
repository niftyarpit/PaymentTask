//
//  NetBanksTableCell.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 07/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

class NetBanksTableCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var banks: [PaymentHome.PaymentOptions.ViewModel.PreferredBanksViewModel.PreferredBankViewModel] = []
    
    func configureCellWithModel(_ model: [PaymentHome.PaymentOptions.ViewModel.PreferredBanksViewModel.PreferredBankViewModel]) {
        banks = model
        collectionView.reloadData()
    }
}

extension NetBanksTableCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NetBankCollectionCell", for: indexPath) as! NetBankCollectionCell
        cell.configureCellWithModel(banks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension NetBanksTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width/3-3, height: 98)
    }
}

