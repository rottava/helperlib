//
//  StringProtocol+.swift
//  HelperLib
//
//  Created by Edson Rottava on 02/12/20.
//  Copyright © 2020 Rattova's Dev. All rights reserved.
//

import UIKit

extension StringProtocol {
    var firstUppercased: String { return prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { return prefix(1).capitalized + dropFirst() }
}
