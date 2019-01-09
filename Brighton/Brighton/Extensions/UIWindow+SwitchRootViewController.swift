//
//  UIWindow+SwitchRootViewController.swift
//  Brighton
//
//  Created by Wei Sun on 27/12/17.
//

import UIKit

extension UIWindow {

  func switchRootViewController(_ viewController: UIViewController,
                                animated: Bool = true,
                                duration: TimeInterval = 1.0,
                                options:  UIView.AnimationOptions = .transitionCrossDissolve,
                                completion: ((Bool) -> Void)? = nil) {

    guard animated else {
      rootViewController = viewController
      return
    }

    let animation: (() -> Void) = { [weak self] in
      let areAnimationEnabled = UIView.areAnimationsEnabled
      UIView.setAnimationsEnabled(false)
      self?.rootViewController = viewController
      UIView.setAnimationsEnabled(areAnimationEnabled)
    }

    UIView.transition(with: self,
                      duration: duration,
                      options: options,
                      animations: animation,
                      completion: completion)
  }
}
