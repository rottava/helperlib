//
//  Codable+Wrappers.swift
//  HelperLib
//
//  Created by Edson Rottava on 23/10/20.
//  Copyright © 2020 Rattova's Dev. All rights reserved.
//

import Foundation

/// Provides a default value for missing `Decodable` data.
///
/// `DefaultCodableStrategy` provides a generic strategy type that the `DefaultCodable` property wrapper can use to provide a reasonable default value for missing Decodable data.
///
/// More information -> https://gist.github.com/reeichert/e3e15244136426c7f7a7834b9a612a95
public protocol DefaultCodableStrategy {
    associatedtype RawValue: Codable
    
    static var defaultValue: RawValue { get }
}

/// Decodes values with a reasonable default value
///
/// `@Defaultable` attempts to decode a value and falls back to a default type provided by the generic `DefaultCodableStrategy`.
@propertyWrapper
public struct DefaultCodable<Default: DefaultCodableStrategy>: Codable {
    public var wrappedValue: Default.RawValue
    
    public init(wrappedValue: Default.RawValue) {
        self.wrappedValue = wrappedValue
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.wrappedValue = (try? container.decode(Default.RawValue.self)) ?? Default.defaultValue
    }
    
    public func encode(to encoder: Encoder) throws {
        try wrappedValue.encode(to: encoder)
    }
}

extension DefaultCodable: Equatable where Default.RawValue: Equatable { }
extension DefaultCodable: Hashable where Default.RawValue: Hashable { }

// MARK: - KeyedDecodingContainer
public extension KeyedDecodingContainer {

    /// Default implementation of decoding a DefaultCodable
    ///
    /// Decodes successfully if key is available if not fallsback to the default value provided.
    func decode<P>(_: DefaultCodable<P>.Type, forKey key: Key) throws -> DefaultCodable<P> {
        if let value = try decodeIfPresent(DefaultCodable<P>.self, forKey: key) {
            return value
        } else {
            return DefaultCodable(wrappedValue: P.defaultValue)
        }
    }
}

// MARK: - Default Wrappers

// MARK: Int
struct DefaultIntStrategy: DefaultCodableStrategy {
    static var defaultValue: Int { return 0 }
}

typealias DefaultInt = DefaultCodable<DefaultIntStrategy>

// MARK: Double
struct DefaultDoubleStrategy: DefaultCodableStrategy {
    static var defaultValue: Double { return 0.0 }
}

typealias DefaultDouble = DefaultCodable<DefaultDoubleStrategy>

// MARK: String
struct DefaultStringStrategy: DefaultCodableStrategy {
    static var defaultValue: String { return "" }
}

typealias DefaultString = DefaultCodable<DefaultStringStrategy>

// MARK: Array
public struct DefaultEmptyArrayStrategy<T: Codable>: DefaultCodableStrategy {
    public static var defaultValue: [T] { return [] }
}

/// Decodes Arrays returning an empty array instead of nil if appicable
///
/// `@DefaultEmptyArray` decodes Arrays and returns an empty array instead of nil if the Decoder is unable to decode the container.
public typealias DefaultEmptyArray<T> = DefaultCodable<DefaultEmptyArrayStrategy<T>> where T: Codable

// MARK: Bool
struct DefaultFalseStrategy: DefaultCodableStrategy {
    static var defaultValue: Bool { return false }
}

/// Decodes Bools defaulting to `false` if applicable
///
/// `@DefaultFalse` decodes Bools and defaults the value to false if the Decoder is unable to decode the value.
typealias DefaultFalse = DefaultCodable<DefaultFalseStrategy>
