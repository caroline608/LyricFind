//
//  SongTableViewCell.swift
//  LyricApp
//
//  Created by C4Q on 3/9/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher


class SearchTableViewCell: UITableViewCell {

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named:"beauty")
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "SearchCell")
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // we get the frame of the UI elements here
        profileImageView.layer.borderWidth = 0.5
        profileImageView.layer.borderColor = UIColor.lightGray.cgColor
        profileImageView.layer.cornerRadius = profileImageView.bounds.width/2.0
        profileImageView.layer.masksToBounds = true
    }
    
    private func setupViews() {
        setupProfileImage()
        setupNameLabel()
    }
    
    private func setupProfileImage() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(snp.centerY)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.equalTo(snp.height).multipliedBy(0.80)
            make.width.equalTo(profileImageView.snp.height)
        }
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.centerY.equalTo(snp.centerY)
        }
    }
    
//    public func configureCell(artist: Artist) {
//        nameLabel.text = artist.name
//        profileImageView.kf.indicatorType = .activity
//        profileImageView.kf.setImage(with: fellow.imageURL, placeholder: UIImage.init(named: "beauty"), options: nil, progressBlock: nil, completionHandler: nil)
//    }
    
}
