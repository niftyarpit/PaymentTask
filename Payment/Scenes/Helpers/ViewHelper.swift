//
//  ViewHelpers.swift
//  Payment
//
//  Created by ARPIT  SRIVASTAVA on 06/12/18.
//  Copyright © 2018 Arpit. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(color: UIColor = UIColor.black.withAlphaComponent(0.5),
                    opacity: Float = 0.5,
                    offSet: CGSize = CGSize(width: 0, height: 0),
                    radius: CGFloat = 2,
                    scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
