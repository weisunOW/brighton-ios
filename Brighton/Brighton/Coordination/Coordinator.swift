//
//  Coordinator.swift
//  Brighton
//
//  Created by Wei Sun on 26/12/17.
//

import UIKit

class Coordinator {

  weak var homeTabBar: HomeTabBarController?
  weak var window: UIWindow?

  init(window: UIWindow?) {

    self.window = window
  }

  // MARK: - Segue injection

  func prepare(segue: UIStoryboardSegue, with context: Context?) {

    guard let coordinated = coordinatedViewController(at: segue.destination) else {
      fatalError("Coordinated view controller cannot be derived from \(segue.destination)")
    }

    coordinated.accept(self, with: context)
  }

  // MARK: - Private functions

  private func coordinatedViewController(at destination: UIViewController?) -> Coordinated? {

    guard let navigationController = destination as? UINavigationController else {
      return destination as? Coordinated
    }
    
    return coordinatedViewController(at: navigationController.topViewController)
  }
}
