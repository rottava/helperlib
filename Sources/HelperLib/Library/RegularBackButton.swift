//
//  RegularBackButton.swift
//  HelperLib
//
//  Created by Edson Rottava on 18/08/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import UIKit

class RegularBackButton: UIBarButtonItem {
  @available(iOS 14.0, *)
  override var menu: UIMenu? {
    set {
      /* Don't set the menu here */
      /* super.menu = menu */
    }
    get {
      return super.menu
    }
  }
}
