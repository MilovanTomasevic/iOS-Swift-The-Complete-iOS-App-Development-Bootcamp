//
//  ViewController.swift
//  ByteCoin
//
//  Milovan Tomašević on 29/09/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var bitcoinLabel: UILabel!
  @IBOutlet var currencyLabel: UILabel!
  @IBOutlet var currencyPicker: UIPickerView!
  
  var coinManager = CoinManager()
//  let coinModel = CoinModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    currencyPicker.delegate = self
    currencyPicker.dataSource = self
    coinManager.delegate = self
  }
  
}

extension ViewController: CoinManagerDelegate {
  func didUpdatePrice(_ price: String, _ currency: String) {
    DispatchQueue.main.async {
      self.bitcoinLabel.text = price
      self.currencyLabel.text = currency
    }
  }
}

extension ViewController: UIPickerViewDelegate {
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return coinManager.currencyArray[row]
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    let selectedCurrency = coinManager.currencyArray[row]
    coinManager.fetchCoin(selectedCurrency)
  }
}

extension ViewController: UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    coinManager.currencyArray.count
  }
}
