//
//  Extension.swift
//  RickAndMorty
//
//  Created by Tufail Ahmad on 23/10/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views : UIView...){
        views.forEach( {
            addSubview($0)
        })
    }
}

