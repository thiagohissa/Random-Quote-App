//
//  Quote.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import Foundation

class Quote {
    var quoteText: String?
    var quoteAuthor: String?
    
    init(quoteText: String, quoteAuthor: String) {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
    }
    
}
