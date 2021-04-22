//
//  ViewController.swift
//  Clima
//
//  Created by Milovan Tomašević on 19/09/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
  
  @IBOutlet weak var conditionImageView: UIImageView!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!
  
  var weatherManager = WeatherManager()
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()
    
    // Do any additional setup after loading the view.
    searchTextField.delegate = self
    weatherManager.delegate = self
  }
  
  @IBAction func searchPressed(_ sender: UIButton) {
    searchTextField.endEditing(true)
    guard let searchText = searchTextField.text else { return }
    print(searchText)
  }
  
  @IBAction func currentLocation(_ sender: UIButton) {
    locationManager.requestLocation()
  }
}

// MARK: - UITextFieldDelegate

extension WeatherViewController: UITextFieldDelegate {

  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    searchTextField.endEditing(true)
    guard let searchText = searchTextField.text else { return true }
    print(searchText)
    
    return true
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    
    guard let city = searchTextField.text else { return }
    weatherManager.fetchWeather(cityName: city)
    
    searchTextField.text = ""
  }
  
  func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
    if textField.text != "" {
      return true
    } else {
      textField.placeholder = "검색할 내용을 입력해 주세요"
      return false
    }
    
    return true
  }
}

// MARK: - WeatherManagerDelegate

extension WeatherViewController: WeatherManagerDelegate {
  func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherData) {
    DispatchQueue.main.async {
      self.temperatureLabel.text = weather.temperatureString
      self.cityLabel.text = weather.cityName
      self.conditionImageView.image = UIImage(systemName: weather.conditionName)
    }
  }
  
  func didFailWithError(error: Error) {
    print(error)
  }
}

// MARK: - CLLocationManagerDelegate

extension WeatherViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    locationManager.stopUpdatingLocation()
    guard let location = locations.last else { return }
    let lat = location.coordinate.latitude
    let lon = location.coordinate.longitude
    
    weatherManager.fetchWeather(latitude: lat, longitude: lon)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error.localizedDescription)
  }
}
