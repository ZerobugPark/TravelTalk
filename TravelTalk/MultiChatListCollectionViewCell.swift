//
//  MultiChatListCollectionViewCell.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/10/25.
//

import UIKit

class MultiChatListCollectionViewCell: UICollectionViewCell, ObjectSetup {

    

    @IBOutlet var firstUserImageView: UIImageView!
    @IBOutlet var secondUserImageView: UIImageView!
    @IBOutlet var thirdUserImageView: UIImageView!
    @IBOutlet var fourthUserImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var userLastChatLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    static let identifier = "MultiChatListCollectionViewCell"
    
    lazy var userImageViews: [UIImageView] = [firstUserImageView, secondUserImageView, thirdUserImageView, fourthUserImageView]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        imageViewConfig()
        labelConfig()
    }
    
    
    
    
    func imageViewConfig() {
        for i in 0..<userImageViews.count {
            userImageViews[i].contentMode = .scaleAspectFit
            userImageViews[i].layer.borderColor = UIColor.lightGray.cgColor
            userImageViews[i].layer.borderWidth = 0.5
        }
    }
    
    func labelConfig() {
        userNameLabel.font = .boldSystemFont(ofSize: 15)
        
        userLastChatLabel.font = .systemFont(ofSize: 14)
        userLastChatLabel.textColor = .lightGray
        
        timeLabel.font = .systemFont(ofSize: 14)
        timeLabel.textColor = .lightGray
        timeLabel.textAlignment = .right
        
    }
    
    
    func configMultiData(chatInfo: [ChatRoom], item: Int) {
        
        let lastMessageIndex = chatInfo[item].chatList.count - 1
        
        for i in 0..<chatInfo[item].chatroomImage.count {
            let userImage = chatInfo[item].chatroomImage[i]
            userImageViews[i].image = UIImage(named: userImage)
        }
        
        

        userNameLabel.text = chatInfo[item].chatroomName
        
        userLastChatLabel.text = chatInfo[item].chatList[lastMessageIndex].message
        
    
        
        
        
    }
}
