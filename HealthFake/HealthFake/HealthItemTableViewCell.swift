//
//  HealthItemTableViewCell.swift
//  HealthFake
//
//  Created by Laibit on 2018/11/2.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class HealthItemTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(imageID: String, title: String){
        iconImage.image = UIImage(named: imageID)
        titleLabel.text = title        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
