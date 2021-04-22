//
//  Weather.swift
//  Clima
//
//  Created by Milovan Tomašević on 19/09/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import Foundation

struct WeatherData {
  let conditionId: Int
  let cityName: String
  let temperature: Double
  
  var temperatureString: String {
    return String(format: "%.1f", temperature)
  }
  
  var conditionName: String {
    switch conditionId {
    case 200...232:
      return "cloud.bolt"
    case 300...321:
      return "cloud.drizzle"
    case 500...531:
      return "cloud.rain"
    case 600...622:
      return "cloud.snow"
    case 701...781:
      return "cloud.fog"
    case 800:
      return "sun.max"
    case 801...804:
      return "cloud.bolt"
    default:
      return "cloud"
    }
  }
}
