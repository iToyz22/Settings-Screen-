//
//  RedLabelTableViewCell.swift
//  Settings screen TableView
//
//  Created by Anatoliy on 15.06.2022.
//

import UIKit

class RedLabelTableViewCell: UITableViewCell {
static let identifier = "RedLabelTableViewCell"
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private lazy var iconContainerRed: UIView = {
        let view2 = UIView()
        view2.clipsToBounds = true
        view2.layer.masksToBounds = true
        view2.backgroundColor = .white

        return view2
       
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let iconImageViewRed: UIImageView = {
        let imageViewRed = UIImageView()
        imageViewRed.tintColor = .red
        imageViewRed.backgroundColor = .white
        imageViewRed.contentMode = .scaleAspectFit
        imageViewRed.translatesAutoresizingMaskIntoConstraints = false
        return imageViewRed
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainerRed)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(iconImageViewRed)
        contentView.clipsToBounds = true
        accessoryType = .none
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupLayout() {
        iconContainer.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        iconContainer.widthAnchor.constraint(equalToConstant: 32).isActive = true
        iconContainer.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        iconImageView.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor).isActive = true
        iconImageView.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor).isActive = true
        
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: iconContainer.trailingAnchor, constant: 8).isActive = true
        
        iconImageViewRed.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        iconImageViewRed.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        iconImageViewRed.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -26).isActive = true
        iconImageViewRed.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 356).isActive = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        iconImageViewRed.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        iconContainerRed.backgroundColor = nil
    }
    
    public func configure(with model: SettingsRedLogoOption) {
        label.text = model.title
        label.textColor = .black
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        iconImageViewRed.image = model.icon2
       
    }
}
