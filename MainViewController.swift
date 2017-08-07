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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

    //MARK: IBActions
    @IBAction func newQuoteButton(_ sender: Any) {
        performSegue(withIdentifier: "SegueToQuoteBuilder", sender: sender)
    }
    
    
    
    
    
    
    //MARK: AddQuoteToTable Protocol
    func greeting(message:String){
        print("\(message)")
    }
    

    
    
    
    
    
    
    
    
    
    //MARK: TableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = myTableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        cell.quoteLabel.text = "hello"
        cell.authorLabel.text = "author"
        return cell
    }
    
    
    
    

}







