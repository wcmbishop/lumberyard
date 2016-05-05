//
//  LogStore.swift
//  lumberyard
//
//  Created by BenJoaquín Gouverneur on 4/15/16.
//  Copyright © 2016 Tranquility Base. All rights reserved.
//

import Foundation

class LogStore {
    
    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    func fetchToolsList() {
        let url = LumberyardAPI.toolsListURL()
        let request = NSURLRequest(URL: url!) //forced unwrap of an optional should include verification
        let task = session.dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                if let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding) {
                    print(jsonString)
                }
            }
            else if let requestError = error {
                print("Error fetching tools list: \(requestError)")
            }
            else {
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
}

