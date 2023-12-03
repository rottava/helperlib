// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(OSX)
  import AppKit.NSImage
  internal typealias AssetColorTypeAlias = NSColor
  internal typealias AssetImageTypeAlias = NSImage
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIImage
  internal typealias AssetColorTypeAlias = UIColor
  internal typealias AssetImageTypeAlias = UIImage
#endif

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
    internal static let logoDark = ImageAsset(name: "logoDark")
    internal static let logoWhite = ImageAsset(name: "logoWhite")
    
    internal enum Colors {
        internal static let alert = ColorAsset(name: "Colors/alert")
        internal static let black = ColorAsset(name: "Colors/black")
        internal static let error = ColorAsset(name: "Colors/error")
        internal static let gray = ColorAsset(name: "Colors/gray")
        internal static let gray1 = ColorAsset(name: "Colors/gray1")
        internal static let gray2 = ColorAsset(name: "Colors/gray2")
        internal static let gray3 = ColorAsset(name: "Colors/gray3")
        internal static let gray4 = ColorAsset(name: "Colors/gray4")
        internal static let offWhite = ColorAsset(name: "Colors/offWhite")
        internal static let orange = ColorAsset(name: "Colors/orange")
        internal static let primary = ColorAsset(name: "Colors/primary")
        internal static let primaryDark = ColorAsset(name: "Colors/primaryDark")
        internal static let primaryLight = ColorAsset(name: "Colors/primaryLight")
        internal static let secondary = ColorAsset(name: "Colors/secondary")
        internal static let secondaryDark = ColorAsset(name: "Colors/secondaryDark")
        internal static let secondaryLight = ColorAsset(name: "Colors/secondaryLight")
        internal static let secondaryLighter = ColorAsset(name: "Colors/secondaryLighter")
        internal static let white = ColorAsset(name: "Colors/white")
    }
    
    internal enum Icons {
        internal static let alert = ImageAsset(name: "Icons/icAlert")
        internal static let bar = ImageAsset(name: "Icons/icBar")
        internal static let check = ImageAsset(name: "Icons/icCheck")
        internal static let chevD = ImageAsset(name: "Icons/icChevD")
        internal static let chevL = ImageAsset(name: "Icons/icChevL")
        internal static let chevR = ImageAsset(name: "Icons/icChevR")
        internal static let chevU = ImageAsset(name: "Icons/icChevU")
        internal static let close = ImageAsset(name: "Icons/icClose")
        internal static let delete = ImageAsset(name: "Icons/icDelete")
        internal static let doc = ImageAsset(name: "Icons/icDoc")
        internal static let drop = ImageAsset(name: "Icons/icDrop")
        internal static let edit = ImageAsset(name: "Icons/icEdit")
        internal static let eye = ImageAsset(name: "Icons/icEye")
        internal static let eyeClosed = ImageAsset(name: "Icons/icEyeClosed")
        internal static let fix = ImageAsset(name: "Icons/icFix")
        internal static let gps = ImageAsset(name: "Icons/icGPS")
        internal static let gpsOff = ImageAsset(name: "Icons/icGPSOff")
        internal static let home = ImageAsset(name: "Icons/icHome")
        internal static let marker = ImageAsset(name: "Icons/icMarker")
        internal static let markerS = ImageAsset(name: "Icons/icMarkerS")
        internal static let plus = ImageAsset(name: "Icons/icPlus")
        internal static let profile = ImageAsset(name: "Icons/icProfile")
        internal static let recent = ImageAsset(name: "Icons/icRecent")
        internal static let reload = ImageAsset(name: "Icons/icReload")
        internal static let search = ImageAsset(name: "Icons/icSearch")
        internal static let send = ImageAsset(name: "Icons/icSend")
        internal static let services = ImageAsset(name: "Icons/icServices")
        internal static let shiny = ImageAsset(name: "Icons/icShiny")
        internal static let tires = ImageAsset(name: "Icons/icTires")
        internal static let uncheck = ImageAsset(name: "Icons/icUncheck")
        internal static let userDoc = ImageAsset(name: "Icons/icUserDoc")
        internal static let upload = ImageAsset(name: "Icons/icUpload")
        internal static let valid = ImageAsset(name: "Icons/icValid")
        internal static let work = ImageAsset(name: "Icons/icWork")
    }
    
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ColorAsset {
  internal fileprivate(set) var name: String

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  internal var color: AssetColorTypeAlias {
    return AssetColorTypeAlias(asset: self)
  }
}

internal extension AssetColorTypeAlias {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, OSX 10.13, *)
  convenience init!(asset: ColorAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct DataAsset {
  internal fileprivate(set) var name: String

  #if os(iOS) || os(tvOS) || os(OSX)
  @available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
  internal var data: NSDataAsset {
    return NSDataAsset(asset: self)
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(OSX)
@available(iOS 9.0, tvOS 9.0, OSX 10.11, *)
internal extension NSDataAsset {
  convenience init!(asset: DataAsset) {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(OSX)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  internal var image: AssetImageTypeAlias {
    let bundle = Bundle(for: BundleToken.self)
    #if os(iOS) || os(tvOS)
    let image = AssetImageTypeAlias(named: name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = AssetImageTypeAlias(named: name)
    #endif
    guard let result = image else { fatalError("Unable to load image named \(name).") }
    return result
  }
}

internal extension AssetImageTypeAlias {
  @available(iOS 1.0, tvOS 1.0, watchOS 1.0, *)
  @available(OSX, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init!(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = Bundle(for: BundleToken.self)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(OSX)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

private final class BundleToken {}
