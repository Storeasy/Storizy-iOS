//
//  HeartPageCell.swift
//  Storizy-iOS
//
//  Created by 임수정 on 2021/11/08.
//

import UIKit

class HeartPageCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nicknameLB: UILabel!
    @IBOutlet weak var pageTitleLB: UILabel!
    @IBOutlet weak var pageContentLB: UILabel!
    @IBOutlet weak var heartBTN: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.contentView.backgroundColor = UIColor(named: "extra_white")
        } else {
            self.contentView.backgroundColor = UIColor(named: "extra_white")
        }

    }
    
    // ui
    func setUI(){
        profileImg.layer.cornerRadius = profileImg.bounds.width / 2
    }
    
}
