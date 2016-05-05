//
//  Log.swift
//  lumberyard
//
//  Created by BenJoaquín Gouverneur on 5/5/16.
//  Copyright © 2016 Tranquility Base. All rights reserved.
//

import Foundation

class Tool {
    
    let tool: String
    let alias: String
    let description: String
    let tool_class: String
    let create_date: String
    let update_date: String
    
    init(tool: String, alias: String, description: String, tool_class: String, create_date: String, update_date: String) {
        self.tool = tool
        self.alias = alias
        self.description = description
        self.tool_class = tool_class
        self.create_date = create_date
        self.update_date = update_date
    }
}