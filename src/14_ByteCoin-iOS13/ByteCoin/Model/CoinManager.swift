//
//  CoinManager.swift
//  ByteCoin
//
//  Milovan Tomašević on 29/09/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
  func didUpdatePrice(_ price: String, _ currency: String)
}

struct CoinManager {
  
  let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
  let apiKey = "D8D7DD69-E6F2-4D60-BE40-6F4634080725"
  
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
  var delegate: CoinManagerDelegate?
  
  func fetchCoin(_ currency: String) {
    let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
    print("DEBUG: ", urlString)
//    performRequest(urlString, currency)
    performRequest(urlString, currency) {
      print(1111)
    }
  }
  
  func performRequest(_ urlString: String, _ curreny: String, completion: @escaping () -> Void) {
    guard let url = URL(string: urlString) else { return }
    let session = URLSession.shared
    
    let task = session.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      }
      
      guard let data = data else { return }
      
      do {
        let decoder = JSONDecoder()
        let objects = try decoder.decode(CoinModel.self, from: data)
        let priceString = String(format: "%.2f", objects.rate)
        
        self.delegate?.didUpdatePrice(priceString, curreny)
      } catch let jsonError {
        print("Failed to decode: ", jsonError.localizedDescription)
      }
      
    }
    task.resume()
  }
}
