//
//  APIManager.swift
//  Quote App
//
//  Created by Thiago Hissa on 2017-08-07.
//  Copyright © 2017 Thiago Hissa. All rights reserved.
//

import Foundation
import UIKit

class APIManager {
    
    
    //MARK: API getQuote:
    func getQuote(completion: @escaping (String, String)->Void){
        /* Configure session, choose between:
         * defaultSessionConfiguration
         * ephemeralSessionConfiguration
         * backgroundSessionConfigurationWithIdentifier:
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDelegate. */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /* Create the Request:
         Request (GET http://api.forismatic.com/api/1.0/)
         */
        
        guard var URL = URL(string: "https://api.forismatic.com/api/1.0/") else {return}
        let URLParams = [
            "method": "getQuote",
            "lang": "en",
            "format": "json",
            ]
        URL = URL.appendingQueryParameters(URLParams)
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        // Headers
        
        request.addValue("__cfduid=d2607fdd4c3e9814218656a4b46bbe5391502129992", forHTTPHeaderField: "Cookie")
        
        /* Start a new Task */
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                guard let json = try? JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any] else {
                    print("data returned is not json, or not valid")
                    return
                }
                
                completion(json["quoteText"] as! String, json["quoteAuthor"] as! String)
            }
            else {
                // Failure
                print("URL Session Task Failed: %@", error!.localizedDescription);
            }
        })
        task.resume()
        session.finishTasksAndInvalidate()
    }







    //MARK: API GetImage:

    func getImage(completion: @escaping (Data)->Void){
    /* Configure session, choose between:
     * defaultSessionConfiguration
     * ephemeralSessionConfiguration
     * backgroundSessionConfigurationWithIdentifier:
     And set session-wide properties, such as: HTTPAdditionalHeaders,
     HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
     */
    let sessionConfig = URLSessionConfiguration.default
    
    /* Create session, and optionally set a URLSessionDelegate. */
    let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    
    /* Create the Request:
     Image Request (GET http://lorempixel.com/200/300/)
     */
    
    guard let URL = URL(string: "https://lorempixel.com/200/300/") else {return}
    var request = URLRequest(url: URL)
    request.httpMethod = "GET"
    
    /* Start a new Task */
    let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
        if (error == nil) {
            // Success
            let statusCode = (response as! HTTPURLResponse).statusCode
            print("URL Session Task Succeeded: HTTP \(statusCode)")
 
            completion(data!)
            
        }
        else {
            // Failure
            print("URL Session Task Failed: %@", error!.localizedDescription);
        }
    })
    task.resume()
    session.finishTasksAndInvalidate()
}



}








protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
    
}

extension URL {
    /**
     Creates a new URL by adding the given query parameters.
     @param parametersDictionary The query parameter dictionary to add.
     @return A new URL.
     */
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
    
    
    
    
    
}



    


    
    

