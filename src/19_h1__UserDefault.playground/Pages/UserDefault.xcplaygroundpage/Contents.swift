import Cocoa

let defaults = UserDefaults.standard
let dictionaryKey = "myDictionary"

defaults.set(0.25, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Milovan", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenByUser")

let array = [1, 2, 3]
defaults.set(array, forKey: "myArray")

let dic = ["name": "Milovan Tomasevic", "mail": "tomas.ftn.e2@gmail.com"]
defaults.set(dic, forKey: dictionaryKey)






let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenByUser")
let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDic = defaults.dictionary(forKey: dictionaryKey)
