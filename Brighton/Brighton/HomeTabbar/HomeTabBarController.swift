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

extension HomeTabBarController: Coordinated {

  func accept(_ coordinator: Coordinator, with context: Context?) {
    coordinator.visit(self, with: context)
  }
}

extension Coordinator {

  func visit(_ coordinated: HomeTabBarController, with context: Context? = nil) {

    coordinated.delegate = coordinated
    coordinated.context = context
    coordinated.coordinator = self
  }

  func displayHomeScreen(animated: Bool) {

    guard let homeTabBar = UIStoryboard(name: "Home", bundle: nil)
      .instantiateViewController(withIdentifier: "HomeTabBarController") as? HomeTabBarController else {
      return
    }

    self.homeTabBar = homeTabBar
    visit(homeTabBar)
    window?.switchRootViewController(homeTabBar, animated: animated)
  }
}
