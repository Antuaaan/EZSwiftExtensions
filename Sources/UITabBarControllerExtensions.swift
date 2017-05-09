//
//  UITabBarControllerExtensions.swift
//  EZSwiftExtensions
//
//  Created by Anton Mansvelt on 2017/05/08.
//  Copyright © 2017 Anton Mansvelt. All rights reserved.
//

import UIKit

//Adds the swipe gesture to the actual bar of the tab bar
extension UITabBarController {
    func setupSwipeGestureRecognizers(allowCyclingThoughTabs cycleThroughTabs: Bool = false) {
        let swipeLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeLeftAllowingCyclingThroughTabs) : #selector(handleSwipeLeft))
        swipeLeftGestureRecognizer.direction = .left
        self.tabBar.addGestureRecognizer(swipeLeftGestureRecognizer)
        
        let swipeRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: cycleThroughTabs ? #selector(handleSwipeRightAllowingCyclingThroughTabs) : #selector(handleSwipeRight))
        swipeRightGestureRecognizer.direction = .right
        self.tabBar.addGestureRecognizer(swipeRightGestureRecognizer)
    }
    
    @objc fileprivate func handleSwipeLeft(_ swipe: UISwipeGestureRecognizer) {
        self.selectedIndex -= 1
    }
    
    @objc fileprivate func handleSwipeRight(_ swipe: UISwipeGestureRecognizer) {
        self.selectedIndex += 1
    }
    
    @objc fileprivate func handleSwipeLeftAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer) {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex - 1
        self.selectedIndex = nextIndex >= 0 ? nextIndex : maxIndex - 1
        
    }
    
    @objc fileprivate func handleSwipeRightAllowingCyclingThroughTabs(_ swipe: UISwipeGestureRecognizer) {
        let maxIndex = (self.viewControllers?.count ?? 0)
        let nextIndex = self.selectedIndex + 1
        self.selectedIndex = nextIndex < maxIndex ? nextIndex : 0
    }
}
