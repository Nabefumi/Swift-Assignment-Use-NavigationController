//
//  FriendsCell.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-22.
//

import UIKit

class FriendsCell: UITableViewCell {
    
    lazy var avatarView: BaseUIImageView = {
        let iv = BaseUIImageView()
        iv.heightAnchor.constraint(equalToConstant: 60).isActive = true
        iv.widthAnchor.constraint(equalToConstant: 60).isActive = true
        iv.layer.cornerRadius = 30
        return iv
    }()
    
    lazy var nickNameLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var locationLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor(hexString: "#9F9EA5")
        
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = BaseUILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textColor = UIColor(hexString: "#9F9EA5")
        return label
    }()
    
    lazy var labelStack: VStack = {
        let stack = VStack()
        stack.spacing = 10
        stack.addArrangedSubview(nickNameLabel)
        stack.addArrangedSubview(locationLabel)
        stack.addArrangedSubview(ageLabel)
        stack.alignment = .leading
        return stack
    }()
    
    lazy var leftStack: HStack = {
        let stack = HStack()
        stack.spacing = 16
        stack.addArrangedSubview(avatarView)
        stack.addArrangedSubview(labelStack)
        stack.alignment = .center
        
        return stack
    }()
    
    lazy var shareButton: BaceUIButtton = {
        let button = BaceUIButtton()
        button.setImage(UIImage(named: "share"), for: .normal)
        
        return button
    }()
    
    lazy var contentStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(leftStack)
        stack.addArrangedSubview(shareButton)
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        
        contentView.addSubview(contentStack)
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            contentStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func updateView(
        nickName: String,
        age: String,
        location: String,
        image: UIImage?
    ) {
        nickNameLabel.text = nickName
        ageLabel.text = age
        locationLabel.text = location
        avatarView.image = image
    }
}
