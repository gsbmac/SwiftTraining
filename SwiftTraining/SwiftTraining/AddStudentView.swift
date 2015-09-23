
//
//  AddStudentView.swift
//  SwiftTraining
//
//  Created by Seer on 9/23/15.
//  Copyright © 2015 Seer Technologies, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol AddStudentViewProtocol{
    func saveButtonPressed()
}

class AddStudentView:BaseView{
    
    var delegate:AddStudentViewProtocol?
    
    
    @IBOutlet weak var degree: UITextField!
    @IBOutlet weak var bday: UITextField!
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBAction func saveButtonPressed(sender: AnyObject) {
        
        if self.delegate != nil && self.delegate?.saveButtonPressed != nil{
            self.delegate?.saveButtonPressed()
            
        }

        
    }
    
}