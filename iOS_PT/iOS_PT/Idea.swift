//
//  Idea.swift
//  iOS_PT
//
//  Created by Matthias Scherr on 17.04.16.
//  Copyright (c) 2016 Matthias. All rights reserved.
//

import Foundation
class Idea {




    var text: String = ""
    var requirement: [String] = []
    var password: String = ""
    var id: Int = 1
    var category: Int = 0
    var rating: Int = 0
    var location: String = "Regensburg"



    public func postToServerFunctionIdeaPush() -> Void {

        var request = NSMutableURLRequest(URL: NSURL(string: "http://ec2-52-38-212-194.us-west-2.compute.amazonaws.com/ProjectTogetherApi/public/ideas")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"

        var params = ["text":text, "user_id":id, "category":category, "location":location] //as Dictionary<String, AnyObject>

        var err: NSError?
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var err: NSError?
            var json = NSJSONSerialization.JSONObjectWithData(data, options: .MutableLeaves, error: &err) as? NSDictionary

            // Did the JSONObjectWithData constructor return an error? If so, log the error to the console
            if(err != nil) {
                println(err!.localizedDescription)
                let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("Error could not parse JSON: '\(jsonStr)'")
            }
            else {
                // The JSONObjectWithData constructor didn't return an error. But, we should still
                // check and make sure that json has a value using optional binding.
                if let parseJSON = json {
                    // Okay, the parsedJSON is here, let's get the value for 'success' out of it
                    var success = parseJSON["success"] as? Int
                    println("Succes: \(success)")
                }
                else {
                    // Woa, okay the json object was nil, something went worng. Maybe the server isn't running?
                    let jsonStr = NSString(data: data, encoding: NSUTF8StringEncoding)
                    println("Error could not parse JSON: \(jsonStr)")
                }
            }
        })

        task.resume()
        
    }

    


}