//
//  ChatViewController.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/10/25.
//

import UIKit

class ChatViewController: UIViewController {
    
    
    
    
    
    @IBOutlet var tableView: UITableView!
    
    static let identifier = "ChatViewController"
    
    
    
    var chat: ChatRoom?
    var navigationTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        self.navigationItem.title = chat?.chatroomName ?? "타이틀 없음"
        
        configureCollectionView()
    }
    
    
    private func configureCollectionView() {
        
        var xib = UINib(nibName: OtherUserTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: OtherUserTableViewCell.identifier)
        
        xib = UINib(nibName: UserTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: UserTableViewCell.identifier)
        
        xib = UINib(nibName: BasicTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: BasicTableViewCell.identifier)
        
    }
    
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let chat {
            if chat.chatList[indexPath.row].user ==  User.user {
                let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
                cell.configData(chatInfo: chat, row: indexPath.row)
                
                return cell
            } else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: OtherUserTableViewCell.identifier, for: indexPath) as! OtherUserTableViewCell
                cell.configData(chatInfo: chat, row: indexPath.row)
                print(indexPath.row)
                
                DispatchQueue.main.async {
                    cell.otherUserImageView.layer.cornerRadius = cell.otherUserImageView.frame.width / 2
                }
                return cell
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as! BasicTableViewCell
        return cell
        
        
    }
    
    
    
    
}
