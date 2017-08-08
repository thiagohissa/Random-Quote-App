//
//  Quote.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class Quote: Object {
   dynamic var quoteText = ""
   dynamic var quoteAuthor = ""
   dynamic var imageData: NSData = NSData()
}
