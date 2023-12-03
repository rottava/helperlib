//
//  Printer.swift
//  HelperLib
//
//  Created by Edson Rottava on 17/08/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import Foundation

class Printer {
    class func showMessage(_ message: String?, _ code: Int?) {
        //print("Code: \(code ?? 0)")
        //print("Desc: \(message ?? "")")
        ProgressHUD.shared.hide()
        Toast.show(message: message ?? L10n.System.Error.connection)
    }
}
