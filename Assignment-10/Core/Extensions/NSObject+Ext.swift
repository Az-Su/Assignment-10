//
//  NSObject+Ext.swift
//  Assignment-10
//
//  Created by Sailau Almaz Maratuly on 23.01.2023.
//

import Foundation

extension NSObject {
    static var typeName: String {
        String(describing: self)
    }
}
