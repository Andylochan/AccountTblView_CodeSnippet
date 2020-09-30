//
//  MyTableViewCell.swift
//  AccountTableviewTest
//
//  Created by Andy Lochan on 9/23/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit

protocol MyTableViewCellDelegate: AnyObject {
    func didTapButton(with title: String)
}

class MyTableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyTableViewCell", bundle: nil)
    }
    
    weak var delegate: MyTableViewCellDelegate?
    private var title: String = ""
        
    @IBOutlet var button: UIButton!
    @IBAction func didTapButton() {
        delegate?.didTapButton(with: title)
    }
    
    func configure(with title: String) {
        self.title = title
        button.setTitle(title, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        button.setTitleColor(.link, for: .normal)
    }
    
}
