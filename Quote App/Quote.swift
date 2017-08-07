//
//  Quote.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import Foundation
import UIKit

class Quote {
    var quoteText: String?
    var quoteAuthor: String?
    var quotePhoto: UIImage?
    
    init(quoteText: String, quoteAuthor: String, quotePhoto:UIImage) {
        self.quoteText = quoteText
        self.quoteAuthor = quoteAuthor
        self.quotePhoto = quotePhoto
    }
    
}
