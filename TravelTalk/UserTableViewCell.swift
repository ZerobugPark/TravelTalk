//
//  UserTableViewCell.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/12/25.
//

import UIKit

class UserTableViewCell: UITableViewCell, ObjectSetup {


    
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var userChatLabel: UILabel!
    @IBOutlet var bgView: UIView!
    static let identifier = "UserTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setup() {
        labelConfig()
        imageViewConfig()
    }
    
    
    
    func labelConfig() {
        
        userChatLabel.font = .systemFont(ofSize: 12)
        userChatLabel.textColor = .black
        userChatLabel.numberOfLines = 0
        
        timeLabel.font = .systemFont(ofSize: 10)
        timeLabel.textColor = .lightGray
        timeLabel.textAlignment = .right
        
    }
    
    func imageViewConfig() {
        
        bgView.backgroundColor = .white
        bgView.layer.cornerRadius = 10
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    func configData(chatInfo: ChatRoom?, row: Int) {
        
        
        guard let chat = chatInfo else {
            return
        }
        
    
    
        userChatLabel.text = chat.chatList[row].message
        
        
        let date = chat.chatList[row].date
        if let date = formatStringToDate(stringDate: date, inputFormat: "yyyy-MM-dd HH:mm", outputFormat: "HH:mm a") {
            timeLabel.text = date
        } else {
            timeLabel.text = "날짜 변환 오류"
        }
    }
}
