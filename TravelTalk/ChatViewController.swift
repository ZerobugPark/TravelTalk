//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/10/25.
//

import UIKit

class ChatViewController: UIViewController {

    
    static let identifier = "ChatViewController"
    
    var chat:[Chat] = []
    var navigationTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(chat)
       
        
        self.navigationItem.title = navigationTitle
    }
    

    


}
