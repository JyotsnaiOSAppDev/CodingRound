//
//  ViewController.swift
//  networkManagerTest
//
//  Created by Jyotsna Jayanteyee Pandey on 11/01/25.
//

import UIKit

class ViewController: UIViewController,HelperDelegate{
    var stName:String!
    
    func didComplete(response: String) {
        print("jyotsna \(response)")
    }
    
    weak var delegat : HelperDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let obj1 = A()
        obj1.delegate = self
        let  obj2 = B()
        obj2.didComplete(response: "my custom delegate")
    }


}

