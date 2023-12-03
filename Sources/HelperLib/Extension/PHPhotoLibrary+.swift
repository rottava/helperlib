//
//  PHPhotoLibrary+.swift
//  HelperLib
//
//  Created by Edson Rottava on 29/06/21.
//  Copyright © 2021 Rattova's Dev. All rights reserved.
//

import Photos
import UIKit

public extension PHPhotoLibrary {

   static func execute(controller: UIViewController,
                       onAccessHasBeenGranted: @escaping () -> Void,
                       onAccessHasBeenDenied: (() -> Void)? = nil) {

      let onDeniedOrRestricted = onAccessHasBeenDenied ?? {
         let alert = UIAlertController(
            title: "Oops!",
            message: L10n.System.Error.Permission.gallery,
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: L10n.System.Button.cancel, style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: L10n.System.Button.settings, style: .default, handler: { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
               UIApplication.shared.open(settingsURL)
            }
         }))
         controller.present(alert, animated: true)
      }

      let status = PHPhotoLibrary.authorizationStatus()
      switch status {
      case .notDetermined:
         onNotDetermined(onDeniedOrRestricted, onAccessHasBeenGranted)
      case .denied, .restricted:
         onDeniedOrRestricted()
      case .authorized:
         onAccessHasBeenGranted()
      default:
         fatalError("PHPhotoLibrary::execute - \"Unknown case\"")
      }
   }

}

private func onNotDetermined(_ onDeniedOrRestricted: @escaping (()->Void), _ onAuthorized: @escaping (()->Void)) {
   PHPhotoLibrary.requestAuthorization({ status in
      switch status {
      case .notDetermined:
         onNotDetermined(onDeniedOrRestricted, onAuthorized)
      case .denied, .restricted:
         onDeniedOrRestricted()
      case .authorized:
         onAuthorized()
      default:
         fatalError("PHPhotoLibrary::execute - \"Unknown case\"")
      }
   })
}
