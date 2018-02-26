//
//  CustomTableViewCell.swift
//  test
//
//  Created by Yngwie Reigh Vincent Lucero on 26/2/18.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var titleText = UILabel()
    var descriptionText = UILabel()
    var pictureView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.addSubview(titleText)
        contentView.addSubview(descriptionText)
        contentView.addSubview(pictureView)
        
        titleText.textAlignment = .center
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        titleText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleText.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        descriptionText.textAlignment = .left
        descriptionText.numberOfLines = 0
        descriptionText.lineBreakMode = .byTruncatingTail
        descriptionText.translatesAutoresizingMaskIntoConstraints = false

        descriptionText.translatesAutoresizingMaskIntoConstraints = false
        descriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        descriptionText.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.6).isActive = true
        descriptionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 20).isActive = true
        descriptionText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40).isActive = true
        
        pictureView.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleBottomMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleTopMargin]
        pictureView.contentMode = .scaleAspectFit
        pictureView.clipsToBounds = true
        pictureView.translatesAutoresizingMaskIntoConstraints = false
        
        pictureView.leadingAnchor.constraint(equalTo: descriptionText.trailingAnchor, constant: 8).isActive = true
        pictureView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8).isActive = true
        pictureView.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 20).isActive = true
        pictureView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        
        descriptionText.setContentHuggingPriority(.required, for: .vertical)
        descriptionText.setContentCompressionResistancePriority(.required, for: .vertical)
        pictureView.setContentHuggingPriority(.required, for: .horizontal)
        pictureView.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    override func prepareForReuse() {
        pictureView.image = nil
    }
}
