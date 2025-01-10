//
//  ViewController.swift
//  TravelTalk
//
//  Created by youngkyun park on 1/10/25.
//

import UIKit




class ViewController: UIViewController {

    
    var travelTalk = mockChatList
    var charArray: [String] = []
    
    
    @IBOutlet var chatCollectionView: UICollectionView!
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chatCollectionView.delegate = self
        chatCollectionView.dataSource = self
        searchBar.delegate = self
        
        
        setup()
        
        configureCollectionView()
        configureChatCollectionViewLayout()
        
    }
    
    private func setup() {
        let placeholder = "찾고 싶은 사용자를 입력해주세요."
        searchBar.placeholder = placeholder
        searchBar.showsCancelButton = true
    }
    
    
    private func configureCollectionView() {
        
        
        var xib = UINib(nibName: ChatListCollectionViewCell.identifier, bundle: nil)
        chatCollectionView.register(xib, forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier)
        
        xib = UINib(nibName: MultiChatListCollectionViewCell.identifier, bundle: nil)
        chatCollectionView.register(xib, forCellWithReuseIdentifier: MultiChatListCollectionViewCell.identifier)
    }
    
    private func configureChatCollectionViewLayout() {
        
        let layout = UICollectionViewFlowLayout()

        //let deviceWidth = UIScreen.main.bounds.width
        layout.scrollDirection = .vertical
        
        let cellWidth = UIScreen.main.bounds.width
        layout.itemSize = CGSize(width: cellWidth, height: 70)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 16, bottom: 16, right: 10)
        
        
        chatCollectionView.collectionViewLayout = layout
        
        
        
    }


}

// MARK: - CollectionView Delegate

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        travelTalk.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if travelTalk[indexPath.item].chatroomImage.count > 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultiChatListCollectionViewCell.identifier, for: indexPath) as! MultiChatListCollectionViewCell
            
            cell.configMultiData(chatInfo: travelTalk, item: indexPath.item)
            
            for i in 0..<cell.userImageViews.count {
                DispatchQueue.main.async {
                    cell.userImageViews[i].layer.cornerRadius = 10
                }
            }
            return cell
            
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.identifier, for: indexPath) as! ChatListCollectionViewCell
            
            cell.configData(chatInfo: travelTalk, item: indexPath.item)
            
            DispatchQueue.main.async {
                cell.userImageView.layer.cornerRadius = cell.userImageView.frame.width / 2
            }
        
            
            return cell
        }

            
    }
    
    private func searchChatRoom(charArray: [String]) {
        
        let consonant = [
            "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ",
            "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
        ]

        let vowels = [
            "ㅏ", "ㅐ", "ㅑ", "ㅒ", "ㅓ", "ㅔ", "ㅕ", "ㅖ", "ㅗ", "ㅘ", "ㅙ", "ㅚ",
            "ㅛ", "ㅜ", "ㅝ", "ㅞ", "ㅟ", "ㅠ", "ㅡ", "ㅢ", "ㅣ"
        ]
        
        
        if !charArray.isEmpty, consonant.contains(charArray[0]) || vowels.contains(charArray[0]) {
            travelTalk = mockChatList.filter { $0.chatroomName.uppercased().contains("도") }
            chatCollectionView.reloadData()
            
            return
        }
        
        let str = charArray.joined().uppercased()
        
    
        if str.isEmpty {
            travelTalk = mockChatList
        } else {
            travelTalk = mockChatList.filter { $0.chatroomName.uppercased().contains(str) }
        }
        chatCollectionView.reloadData()
        
    }
    
    
}

// MARK: - SearchBar Delegate

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
  
  
        if !text.isEmpty {
            charArray.append(text)
        } else {
            if !charArray.isEmpty {
                charArray.removeLast()
            }
        }

        searchChatRoom(charArray: charArray)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    

    
}
