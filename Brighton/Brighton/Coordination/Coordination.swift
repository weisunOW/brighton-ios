//
//  Coordination.swift
//  Brighton
//
//  Created by Wei Sun on 26/12/17.
//

import UIKit

class CoordinatedTabBarController: UITabBarController {

  var coordinator: Coordinator?
  var context: Context?

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    coordinator?.prepare(segue: segue, with: context)
  }
}

class CoordinatedViewController: UIViewController {

  var coordinator: Coordinator?
  var context: Context?

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    coordinator?.prepare(segue: segue, with: context)
  }
}

protocol Coordinated {

  var coordinator: Coordinator { get set }
  var context: Context { get set }

  func accept(_ coordinator: Coordinator, with context: Context?)
}
