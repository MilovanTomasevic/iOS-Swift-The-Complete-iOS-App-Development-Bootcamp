//
//  WeatherModel.swift
//  Clima
//
//  Created by Milovan Tomašević on 19/09/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import Foundation

struct WeatherModel: Codable {
  
  let name: String
  let main: Main
  let weather: [Weather]
}

struct Main: Codable {
  let temp: Double
}

struct Weather: Codable {
  let id: Int
  let description: String
}
