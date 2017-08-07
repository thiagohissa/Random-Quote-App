//
//  MainViewController.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddQuoteToTable {

    @IBOutlet weak var myTableView: UITableView!
    var apiManager = APIManager()
    var arrayOfQuotes: [Quote] = []
    
    
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
        let newQuote = Quote.init(quoteText: quoteText,
                                  quoteAuthor: quoteAuthor,
                                  quotePhoto: quotePhoto)
        self.arrayOfQuotes.append(newQuote)
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
            arrayOfQuotes.remove(at: indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
    

}







