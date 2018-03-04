//
//  ChatCell.swift
//  ppl chat
//
//  Created by somi on 3/3/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

  @IBOutlet var chatMessageLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
