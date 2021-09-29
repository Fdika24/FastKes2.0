//
//  BigButton.swift
//  FastKes
//
//  Created by Farhandika on 29/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit

class BigButton: UIButton {
    private let myTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    private var viewModel: MyCustomBigButton?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(myTitleLabel)
        addSubview(icon)
    }
    init(with viewModel: MyCustomBigButton) {
        super.init(frame: .zero)
        self.viewModel = viewModel
        addSubview(myTitleLabel)
        addSubview(icon)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func configure(viewModel: MyCustomBigButton) {
        myTitleLabel.text = viewModel.title
        if viewModel.isSystemImage, #available(iOS 13.0, *) {
            icon.image = UIImage(systemName: viewModel.imageName)
        } else {
            icon.image = UIImage(named: viewModel.imageName)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            icon.heightAnchor.constraint(equalToConstant: frame.height*0.4),
            icon.widthAnchor.constraint(equalToConstant: frame.width*0.7),
            myTitleLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 5),
            myTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
            myTitleLabel.widthAnchor.constraint(equalToConstant: frame.width*0.9),
            myTitleLabel.heightAnchor.constraint(equalToConstant: frame.height*0.2)
        ])
    }
}

struct MyCustomBigButton {
    let title: String
    let imageName: String
    let isSystemImage: Bool
}
