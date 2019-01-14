//
//  EnumUtils.swift
//  NY Times Most Popular Articles
//
//  Created by Abdul Nasir B A on 14/1/19.
//  Copyright © 2019 Abdul Nasir B A. All rights reserved.
//

import Foundation

class EnumUtils {

    /**
    Iterates over an enum values.     
     */
    public static func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }

}
