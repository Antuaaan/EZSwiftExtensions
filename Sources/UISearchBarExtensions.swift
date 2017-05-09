//
//  UISearchBarExtensions.swift
//  EZSwiftExtensions
//
//  Created by Anton Mansvelt on 2017/05/08.
//  Copyright © 2017 Anton Mansvelt. All rights reserved.
//

import UIKit


public extension UISearchBar {
    //To update the text colour of a searchBar
    public func setTextColour(_ color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.textColor = color
    }
    //To update the bavkground colour of a searchBar
    public func setBackgroundColour(_ color: UIColor) {
        let svs = subviews.flatMap { $0.subviews }
        guard let tf = (svs.filter { $0 is UITextField }).first as? UITextField else { return }
        tf.backgroundColor = color
    }
}
