//
//  Delegate.swift
//  networkManagerTest
//
//  Created by Jyotsna Jayanteyee Pandey on 11/01/25.
//

import Foundation
protocol HelperDelegate: AnyObject {
    func didComplete(response: String)
}
class A {
    weak var delegate: HelperDelegate?
//    init (delegate: HelperDelegate) {
//        self.delegate = delegate
//    }
    func someMethod() {
        delegate?.didComplete(response: "Hello")
    }
}

class B: HelperDelegate {
    func didComplete(response: String) {
        print(response)
    }
}


