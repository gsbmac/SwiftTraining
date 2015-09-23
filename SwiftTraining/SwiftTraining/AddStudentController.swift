//
//  AddStudent.swift
//  SwiftTraining
//
//  Created by Seer on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

class AddStudentController:BaseController, AddStudentViewProtocol{
    
    var studentView:AddStudentView?
    
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadXibName("AddStudentView")
        self.studentView = (self.view as! AddStudentView)
        self.studentView?.delegate = self
        
    }
    
    func saveButtonPressed() {
        let name: String = (self.studentView?.name.text)!
        let bday: String = (self.studentView?.bday.text)!
        let degree: String = (self.studentView?.degree.text)!
        
        let details: Dictionary<String,String> = ["name":name,"bday":bday,"degree":degree]
        
        Connector.addStudent(processStudent,details:details)
        print("eto na")
        //self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    func processStudent(details: JSON){
        print("sa wakas")
//        if let navCOn: navigationController = self.navigationController {
//            navCon.popViewControllerAnimated(true)
//        }
//        self.navigationController?.popViewControllerAnimated(true)

        self.dismissViewControllerAnimated(true, completion: {})
        //self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
}
