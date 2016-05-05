//
//  LumberyardAPI.swift
//  lumberyard
//
//  Created by BenJoaquín Gouverneur on 4/14/16.
//  Copyright © 2016 Tranquility Base. All rights reserved.
//
//  Based on "Chapter 19 Web Services" from iOS Programming The Big Nerd Ranch Guide

import Foundation

enum EndPoint: String {
    case ToolsList = "/tools/list"
}

struct LumberyardAPI {
    private static let baseURL = "yard-dev.teslamotors.com"
    private static let basePath = "/lumberyard/api/0.1"
    
    private static func lumberyardURL(endpoint endpoint: EndPoint,
                                               parameters: [String:String]?) -> NSURL? {
        let components = NSURLComponents()
        components.scheme = "http";
        components.host = baseURL
        components.path = basePath + endpoint.rawValue
        
//        let components = NSURLComponents(URL: endpoint, resolvingAgainstBaseURL: baseURL)!
        
        var queryItems = [NSURLQueryItem]()
        
//        let baseParams = [
//            "endpoint": endpoint.rawValue,
//            ]
//        for (key, value) in baseParams {
//            let item = NSURLQueryItem(name: key, value: value)
//            queryItems.append(item)
//        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.URL!
    }
    
    static func toolsListURL() -> NSURL? {
        print(lumberyardURL(endpoint: .ToolsList, parameters: ["tool_class": "ETL"]))
        return lumberyardURL(endpoint: .ToolsList, parameters: ["tool_class": "ETL"])
    }
}