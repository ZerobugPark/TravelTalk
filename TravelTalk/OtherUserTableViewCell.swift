//
//  OtherUserTableViewCell.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/11/25.
//

import UIKit

class OtherUserTableViewCell: UITableViewCell, ObjectSetup {
    
    
    
    
    @IBOutlet var otherUserImageView: UIImageView!
    @IBOutlet var otherUserNameLabel: UILabel!

    
    @IBOutlet var otherUserChatLabel: UILabel!
    
    @IBOutlet var bgView: UIView!
    @IBOutlet var dateLabel: UILabel!
    
    
    static let identifier = "OtherUserTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    
    func setup() {
        imageViewConfig()
        labelConfig()
    }
    
    
    func imageViewConfig() {
        
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 10
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.lightGray.cgColor
        
        otherUserImageView.contentMode = .scaleToFill
        otherUserImageView.layer.borderColor = UIColor.lightGray.cgColor
        otherUserImageView.layer.borderWidth = 0.5
        
    }
    
    func labelConfig() {
        otherUserNameLabel.font = .boldSystemFont(ofSize: 13)
        
        otherUserChatLabel.font = .systemFont(ofSize: 12)
        otherUserChatLabel.textColor = .black
        otherUserChatLabel.numberOfLines = 0
        
        dateLabel.font = .systemFont(ofSize: 10)
        dateLabel.textColor = .lightGray
        dateLabel.textAlignment = .right
        
    }
    
    
    func configData(chatInfo: ChatRoom?, row: Int) {
        
        
        guard let chat = chatInfo else {
            return
        }
        
        let userImage = chat.chatList[row].user.profileImage
        otherUserImageView.image = UIImage(named: userImage)
        print(userImage)
        
        
        otherUserNameLabel.text = chat.chatList[row].user.rawValue
        otherUserChatLabel.text = chat.chatList[row].message
        
        
        let date = chat.chatList[row].date
        if let date = formatStringToDate(stringDate: date, inputFormat: "yyyy-MM-dd HH:mm", outputFormat: "HH:mm a") {
            dateLabel.text = date
        } else {
            dateLabel.text = "날짜 변환 오류"
        }
    }
    
    
    
    
    
    
}
