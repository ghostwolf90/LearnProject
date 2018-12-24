//
//  ChatTableViewCell.swift
//  line
//
//  Created by Laibit on 2018/11/30.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var dialogueTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }
    
    func initView() {
        iconImage.layer.cornerRadius = 4
        dialogueTextView.textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        dialogueTextView.backgroundColor = UIColor.gray
        dialogueTextView.layer.cornerRadius = 4
        dialogueTextView.isEditable = false
    }
    
    func setData(imageName: String, dialogue: String) {
        self.iconImage.image = UIImage(named: imageName)
        dialogueTextView.text = dialogue
    }
    
   

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
