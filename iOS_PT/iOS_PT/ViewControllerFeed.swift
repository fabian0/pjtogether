//
//  ViewController.swift
//  iOS_PT
//
//  Created by Matthias Scherr on 17.04.16.
//  Copyright (c) 2016 Matthias. All rights reserved.
//

import UIKit

class ViewControllerFeed: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var TableView: UITableView!
    private var data: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()

        TableView.delegate = self
        TableView.dataSource = self


    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.



        let allContactsData=NSData(contentsOfURL:NSURL(string: "http://ec2-52-38-212-194.us-west-2.compute.amazonaws.com/ProjectTogetherApi/public/ideas/latest/Regensburg")!)

        data = NSJSONSerialization.JSONObjectWithData(allContactsData!, options: NSJSONReadingOptions(0), error: nil) as! NSArray

TableView.reloadData()

        /*var request = NSMutableURLRequest(URL: NSURL(string: "http://ec2-52-38-212-194.us-west-2.compute.amazonaws.com/ProjectTogetherApi/public/ideas/latest/Regensburg")!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"



        var err: NSError?
        //request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params, options: nil, error: &err)
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")

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

NSJSONSerialization.dataWithJSONObject(<#obj: AnyObject#>, options: <#NSJSONWritingOptions#>, error: <#NSErrorPointer#>)

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
        
        task.resume()*/








    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCellWithIdentifier("cellIdea", forIndexPath: indexPath)
let idea = data.objectAtIndex(indexPath.row) as! NSDictionary


        if let titleLabel = cell.textLabel {
            titleLabel!.text = idea.valueForKey("text") as? String
        }

        if let detailLabel = cell.detailTextLabel {
            detailLabel!.text = idea.valueForKey("location") as? String //category muss text werden
        }


        return cell as! UITableViewCell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

