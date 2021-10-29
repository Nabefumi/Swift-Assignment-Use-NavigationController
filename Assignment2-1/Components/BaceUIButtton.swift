//
//  BaceUIButtton.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-21.
//

import UIKit

class BaceUIButtton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}
