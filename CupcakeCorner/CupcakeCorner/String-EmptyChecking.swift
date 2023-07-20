//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Brandon Johns on 7/19/23.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
