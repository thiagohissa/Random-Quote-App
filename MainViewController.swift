//
//  MainViewController.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddQuoteToTable {

    @IBOutlet weak var myTableView: UITableView!
    var apiManager = APIManager()
    
    let realm = try! Realm() // [1]
    var arrayOfQuotes: Results<Quote> { // [2]
        get {
            return realm.objects(Quote.self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    //MARK: IBActions
    @IBAction func newQuoteButton(_ sender: Any) {
        performSegue(withIdentifier: "SegueToQuoteBuilder", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueToQuoteBuilder" {
            let nav = segue.destination as! UINavigationController
            let dvc = nav.viewControllers[0] as! QuoteBuilderViewController
            dvc.delegate = self
        }
    }

    
    
    
    //MARK: AddQuoteToTable Protocol
    func saveQuote(quoteText: String, quoteAuthor: String, quotePhoto: UIImage){

        let newQuote = Quote()
        newQuote.quoteText = quoteText
        newQuote.quoteAuthor = quoteAuthor
        newQuote.imageData = UIImagePNGRepresentation(quotePhoto)! as NSData
        
        try! realm.write{
            realm.add(newQuote)
        }
        
        myTableView.reloadData()
    }
    

    
    
    
    
    
    
    
    
    
    //MARK: TableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfQuotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        let quote = self.arrayOfQuotes[indexPath.row]
        cell.quoteLabel.text = quote.quoteText
        cell.authorLabel.text = quote.quoteAuthor
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
       
            if (editingStyle == .delete){
                let quoteToDelete = arrayOfQuotes[indexPath.row]
                try! self.realm.write({
                    self.realm.delete(quoteToDelete)
                })
            }
            
            myTableView.reloadData()
        }
    }
    
    
    

}







