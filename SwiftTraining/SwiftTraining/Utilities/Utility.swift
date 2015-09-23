//
//  Utility.swift
//  SwiftTraining
//
//  Created by Allister Alambra on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation

struct Student{
    var name: String = ""
    var bday: String = ""
    var degree: String = ""
}

class Connector{
    
    class func addStudent(completion:(JSON) ->(), details: Dictionary<String,String>){
        let request = NSMutableURLRequest(URL: NSURL(string: "http://localhost:5000/add_student")!)
        request.HTTPMethod = "POST"
        
        // TO DO: Iterate over dictionary to build post string
        let postString = "var1=val1&var2=var2"
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil {
                return
            }
            // Response provided by the API
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(responseString)
            
        }
        task.resume()
    }
 
    class func getStudents(completion: (JSON) -> ()){
        
        let url : String = "http://localhost:5000/get_students"
        let request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = NSURL(string: url)
        request.HTTPMethod = "GET"
        print("GOING HERE")
        let session = NSURLSession.sharedSession()
        session.dataTaskWithRequest(request, completionHandler: {(data: NSData?, response: NSURLResponse?, error: NSError?) in
            let jsona = JSON(data: data!)
            print("IN HERE \(jsona)")
            completion(jsona)
        }).resume()
    
    }
    
}