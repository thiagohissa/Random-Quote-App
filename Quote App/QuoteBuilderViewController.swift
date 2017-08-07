//
//  QuoteBuilderViewController.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import UIKit

protocol AddQuoteToTable {
    func greeting(message: String)
}

class QuoteBuilderViewController: UIViewController, AddQuoteToTable {
    
    //MARK: Properties
    
    @IBOutlet weak var quoteImage: UIImageView!
    
    @IBOutlet weak var quoteText: UILabel!
    
    @IBOutlet weak var quoteAuthor: UILabel!
    
    var apiManager = APIManager()
    
    var delegate: AddQuoteToTable? = MainViewController()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        generateQuote()
        generateImage()
    }
    

    
    
    
    
    //MARK: IBActions
    
    @IBAction func randomQuoteButton(_ sender: UIButton) {
        generateQuote()
    }
    
    @IBAction func randomImageButton(_ sender: UIButton) {
        generateImage()
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        greeting(message: "Hello")
    }
    
    
    
    
    
    
    //MARK: AddQuoteToTable Protocol
    
    func greeting(message: String){
        delegate?.greeting(message: message)
    }
    
    
    
    
    //MARK: Generate Randoms
    
    func generateImage(){
        self.apiManager.getImage { (data) in
            self.quoteImage.image = UIImage(data: data)
        }
    }
    
    func generateQuote(){
        self.apiManager.getQuote { (quote, author) in
            print(quote)
            print(author)
            self.quoteText.text = quote
            self.quoteAuthor.text = author
        }
    }

 


}
