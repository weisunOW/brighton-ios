//
//  HomeTabbarController.swift
//  Brighton
//
//  Created by Wei Sun on 26/12/17.
//

import UIKit

class HomeTabBarController: CoordinatedTabBarController {
  
}

extension HomeTabBarController: UITabBarControllerDelegate {
  
}

extension Coordinator {

  func displayHomeScreen(animated: Bool) {

    guard let homeTabBar = UIStoryboard(name: "Home", bundle: nil)
      .instantiateViewController(withIdentifier: "HomeTabBarController") as? HomeTabBarController else {
      return
    }

    self.homeTabBar = homeTabBar
    visit(homeTabBar)

    window?.switchRootViewController(homeTabBar, animated: animated)
  }

  func visit(_ coordinated: HomeTabBarController) {

    coordinated.delegate = coordinated
    coordinated.coordinator = self
  }
}
