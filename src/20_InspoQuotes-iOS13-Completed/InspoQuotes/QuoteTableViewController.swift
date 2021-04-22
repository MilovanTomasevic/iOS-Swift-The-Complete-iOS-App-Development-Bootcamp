//
//  QuoteTableViewController.swift
//  InspoQuotes
//
//  Created by Milovan Tomašević on 24/11/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit
import StoreKit

class QuoteTableViewController: UITableViewController, SKPaymentTransactionObserver {

    let productID = "com.londonappbrewery.InspoQuotes.PremiumQuotes"
    
    var quotesToShow = [
        "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius",
        "All our dreams can come true, if we have the courage to pursue them. – Walt Disney",
        "It does not matter how slowly you go as long as you do not stop. – Confucius",
        "Everything you’ve ever wanted is on the other side of fear. — George Addair",
        "Success is not final, failure is not fatal: it is the courage to continue that counts. – Winston Churchill",
        "Hardships often prepare ordinary people for an extraordinary destiny. – C.S. Lewis"
    ]
    
    let premiumQuotes = [
        "Believe in yourself. You are braver than you think, more talented than you know, and capable of more than you imagine. ― Roy T. Bennett",
        "I learned that courage was not the absence of fear, but the triumph over it. The brave man is not he who does not feel afraid, but he who conquers that fear. – Nelson Mandela",
        "There is only one thing that makes a dream impossible to achieve: the fear of failure. ― Paulo Coelho",
        "It’s not whether you get knocked down. It’s whether you get up. – Vince Lombardi",
        "Your true success in life begins only when you make the commitment to become excellent at what you do. — Brian Tracy",
        "Believe in yourself, take on your challenges, dig deep within yourself to conquer fears. Never let anyone bring you down. You got to keep going. – Chantal Sutherland"
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)

        if isPurchased() {
            showPremiumQuotes()
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isPurchased() {
            return quotesToShow.count
        } else {
        return quotesToShow.count + 1
        }
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuoteCell", for: indexPath)

        if indexPath.row < quotesToShow.count{
            cell.textLabel?.text = quotesToShow[indexPath.row]
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            cell.accessoryType = .none
        } else {
            cell.textLabel?.text = "Get More Quotes"
            cell.textLabel?.textColor = #colorLiteral(red: 0.1568627451, green: 0.6666666667, blue: 0.7529411765, alpha: 1)
            cell.accessoryType = .disclosureIndicator
        }

        return cell
    }
   

    // MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == quotesToShow.count {
            buyPremiumQuotes()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - In-App Purchase Methods
    
    func buyPremiumQuotes() {
        if SKPaymentQueue.canMakePayments() {
            //Can make payments
            
           let paymentRequest = SKMutablePayment()
            paymentRequest.productIdentifier = productID
            SKPaymentQueue.default().add(paymentRequest)
            
            
        } else {
            //Can't make payments
            print("User can't make payments")
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            if transaction.transactionState == .purchased {
                
                //User payment successful
                print("Transaction successful!")
                
                showPremiumQuotes()
                
               
                
                SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .failed {
                
                //Payment failed

                if let error = transaction.error {
                    let errorDescription = error.localizedDescription
                    print("Transaction failed due to error: \(errorDescription)")
                }
                
                 SKPaymentQueue.default().finishTransaction(transaction)
                
            } else if transaction.transactionState == .restored {
                
                showPremiumQuotes()
                
                print("Transaction restored")
                
                navigationItem.setRightBarButton(nil, animated: true)
                
                SKPaymentQueue.default().finishTransaction(transaction)
            }
        }
        
    }
    
    func showPremiumQuotes() {
        
        UserDefaults.standard.set(true, forKey: productID)
        
        quotesToShow.append(contentsOf: premiumQuotes)
        tableView.reloadData()
        
    }
    
    func isPurchased() -> Bool {
        let purchaseStatus = UserDefaults.standard.bool(forKey: productID)
        
        if purchaseStatus {
            print("Previously purchased")
            return true
        } else {
            print("Never purchased")
            return false
        }
    }
    
    
    @IBAction func restorePressed(_ sender: UIBarButtonItem) {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
    

}
