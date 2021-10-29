//
//  BaseUILabel.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-21.
//

import UIKit

class BaseUILabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }

}
