//
//  Binding.swift
//  Brighton
//
//  Created by Wei Sun on 26/12/17.
//

import Foundation

protocol Bindable: class {

  associatedtype ViewModel

  var viewModel: ViewModel? { get }

  func bind<ViewModel> (with viewModel: ViewModel)
}
