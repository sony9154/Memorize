//
//  Array+Only.swift
//  Memorize
//
//  Created by Peter Yo on Aug/21/20.
//  Copyright © 2020 Peter Yo. All rights reserved.
//

import Foundation

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
