//
//  GreyLabelTableViewCell.swift
//  Settings screen TableView
//
//  Created by Anatoliy on 15.06.2022.
//
import UIKit

class GreyLabelTableViewCell: UITableViewCell {
static let identifier = "GreyLabelTableViewCell"
    
    private lazy var iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let greyLabel: UILabel = {
        let greyLabel = UILabel()
        greyLabel.numberOfLines = 1
        greyLabel.translatesAutoresizingMaskIntoConstraints = false
        return greyLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(greyLabel)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        setupLayout()
        contentView.clipsToBounds = true
        accessoryType = .none

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
        
        greyLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        greyLabel.rightAnchor.constraint(equalTo: iconContainer.rightAnchor, constant: 350).isActive = true

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        greyLabel.text = nil
        iconContainer.backgroundColor = nil
    }
    
    public func configure(with model: SettingsGreyLabelOption) {
        label.text = model.title
        greyLabel.text = model.title2
        label.textColor = .black
        greyLabel.textColor = .systemGray4
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
    }
}
