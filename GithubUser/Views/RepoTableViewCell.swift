//
//  RepoTableViewCell.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import UIKit

protocol RepoTableViewCellDelegate: AnyObject {
    func expandDescContentClicked(cell: RepoTableViewCell)
}

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var languageLB: UILabel!
    @IBOutlet weak var starCountLB: UILabel!
    @IBOutlet weak var createdAtLB: UILabel!
    @IBOutlet weak var descLB: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    weak var delegate: RepoTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    //
    override func prepareForReuse() {
        self.createdAtLB.text = ""
        self.nameLbl.text = ""
        self.descLB.text = ""
        self.languageLB.text = ""
    }
    
    func setup(data: Repository) {
        self.createdAtLB.text = Utils.shared.utcToLocal(dateStr: data.createdAt) 
        self.nameLbl.text = data.name
        
        self.descLB.text = data.description ?? ""
        let languageStr = Utils.shared.addIconToString(sysIconName: "chevron.left.forwardslash.chevron.right", color: .systemBlue, text: "  \(data.language ?? "  Undetected")")
        let starCountStr = Utils.shared.addIconToString(sysIconName: "star",color: .systemOrange, text: "\(data.starCount) ", isPrefix: false)
        self.languageLB.attributedText = languageStr
        self.starCountLB.attributedText = starCountStr
        if (descLB.estLines() > 1) {
            moreBtn.isHidden = false
            collapContent(isExpand: data.isExpand)
        } else {
            moreBtn.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    @IBAction func moreBtnTapped(_ sender: Any) {
        self.delegate?.expandDescContentClicked(cell: self)
    }
    
    func collapContent(isExpand: Bool) {
        if(isExpand) {
            self.descLB.numberOfLines = 0
            self.moreBtn.setTitle("See Less", for: .normal)
        } else {
            self.descLB.numberOfLines = 1
            self.moreBtn.setTitle("See more", for: .normal)
        }
    }
    
}
