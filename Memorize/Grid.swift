//
//  Grid.swift
//  Memorize
//
//  Created by Peter Yo on Aug/19/20.
//  Copyright © 2020 Peter Yo. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
  var items: [Item]
  var viewForItem: (Item) -> ItemView // viewForItem is a function
  
  init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) { //This function that's passed in here that creates a View for a given item, is not actually used in this initializer.
    self.items = items
    self.viewForItem = viewForItem // So, here's what's going on, look up.
  }
  
  var body: some View {
    GeometryReader { geometry in
      self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
    }
  }
  
  func body(for layout: GridLayout) -> some View {
    ForEach(items) { item in
      self.body(for: item, in: layout)
    }
  }
  
  func body(for item: Item, in layout: GridLayout) -> some View {
    let index = items.firstIndex(matching: item)!
    return viewForItem(item)
        .frame(width: layout.itemSize.width, height: layout.itemSize.height)
        .position(layout.location(ofItemAt: index))
  }
  
  
}


