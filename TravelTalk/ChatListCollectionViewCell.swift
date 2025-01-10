//
//  ChatListCollectionViewCell.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/10/25.
//

import UIKit

class ChatListCollectionViewCell: UICollectionViewCell, ObjectSetup {


    
    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userLastChatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    static let identifier = "ChatListCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    
    
    func setup() {
        imageViewConfig()
        labelConfig()
    }
    
    
    
    
    func imageViewConfig() {
        userImageView.contentMode = .scaleAspectFit
        userImageView.layer.borderColor = UIColor.lightGray.cgColor
        userImageView.layer.borderWidth = 0.5
        
    }
    
    func labelConfig() {
        userNameLabel.font = .boldSystemFont(ofSize: 15)
        
        userLastChatLabel.font = .systemFont(ofSize: 14)
        userLastChatLabel.textColor = .lightGray
        
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
        
    }
    
    
    func configData(chatInfo: [ChatRoom], item: Int) {
        
        let lastIndex = chatInfo[item].chatList.count - 1
        let userImage = chatInfo[item].chatroomImage[0]
        print(userImage)
        
        userNameLabel.text = chatInfo[item].chatroomName

        userLastChatLabel.text = chatInfo[item].chatList[lastIndex].message
        

        userImageView.image = UIImage(named: userImage)
        
        let date = chatInfo[item].chatList[lastIndex].date
        if let date = formatStringToDate(stringDate: date, inputFormat: "yyyy-MM-dd HH:mm", outputFormat: "yy.MM.dd") {
            dateLabel.text = date
        } else {
            dateLabel.text = "날짜 변환 오류"
        }
        
    }
    
    
    
    
}
