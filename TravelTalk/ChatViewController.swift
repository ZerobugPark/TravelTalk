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
        
//        xib = UINib(nibName: MultiChatListCollectionViewCell.identifier, bundle: nil)
//        chatCollectionView.register(xib, forCellWithReuseIdentifier: MultiChatListCollectionViewCell.identifier)
    }
    

    
//    private func configureChatCollectionViewLayout() {
//        
//        let layout = UICollectionViewFlowLayout()
//
//        //let deviceWidth = UIScreen.main.bounds.width
//        layout.scrollDirection = .vertical
//        
//        let cellWidth = UIScreen.main.bounds.width
//        layout.itemSize = CGSize(width: cellWidth, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 16, right: 10)
//        
//        
//        chatCollectionView.collectionViewLayout = layout
//        
//    }


}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chat?.chatList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OtherUserTableViewCell.identifier, for: indexPath) as! OtherUserTableViewCell
        
        print(chat)
        
        cell.configData(chatInfo: chat, row: indexPath.row)
        print(indexPath.row)
        
        DispatchQueue.main.async {
            cell.otherUserImageView.layer.cornerRadius = cell.otherUserImageView.frame.width / 2
        }
        
        return cell
        
    }
    
    
    
    
}
