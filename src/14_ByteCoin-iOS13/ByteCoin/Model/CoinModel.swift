//
//  CoinModel.swift
//  ByteCoin
//
//  Milovan Tomašević on 29/09/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import Foundation

struct CoinModel: Codable {
  let time: String
  let asset_id_base: String
  let asset_id_quote: String
  let rate: Double
}
