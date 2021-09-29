//
//  HospitalTableCell.swift
//  FastKes
//
//  Created by Farhandika on 29/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit

class HospitalTableCell: UITableViewCell {
    
    let titleLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel:UILabel = {
         let label = UILabel()
         label.textAlignment = .left
         label.numberOfLines = 1
         label.font = UIFont.systemFont(ofSize: 15)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    let cellContainer:UIView = {
       let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.layer.cornerRadius = 5
        uiView.layer.masksToBounds = true
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    static let identifier = "HospitalTableCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        contentView.addSubview(cellContainer)
        contentView.backgroundColor = UIColor(named: "bgGreyPerf")
        cellContainer.addSubview(titleLabel)
        cellContainer.addSubview(subTitleLabel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configureSubView(title:String, subTitle:String) {
        self.titleLabel.text = title
        self.subTitleLabel.text = subTitle
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.subTitleLabel.text = nil
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            cellContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -4),
            cellContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: cellContainer.topAnchor,constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: cellContainer.leadingAnchor,constant: 10),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 2),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor)
        ])
    }

}
