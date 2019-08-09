//
//  PostTablViewCell.swift
//  Assignment1
//
//  Created by admin on 09/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PostTablViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func display(post:Post) {
        titleLabel.text = post.title
        subTitleLabel.text = post.createdAt
        
    }

}
