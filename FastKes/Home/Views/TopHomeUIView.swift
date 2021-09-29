//
//  TopHomeUIView.swift
//  FastKes
//
//  Created by Farhandika on 29/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit

class TopHomeUIView: UIView {
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 50)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let helloLabel:UILabel = {
        let label = UILabel ()
        label.text = "Hello,"
        label.font = UIFont(name: "HelveticaNeue", size: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subLabel:UILabel = {
        let label = UILabel()
        label.text = "Welcome to Fastkes!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bgLayer:UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bgHome")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemPink
        self.addSubview(bgLayer)
        self.addSubview(helloLabel)
        self.addSubview(nameLabel)
        self.addSubview(subLabel)
        NSLayoutConstraint.activate([
            bgLayer.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bgLayer.widthAnchor.constraint(equalTo: self.widthAnchor),
            bgLayer.heightAnchor.constraint(equalTo:self.heightAnchor),
            helloLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor,constant: 5),
            helloLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            nameLabel.topAnchor.constraint(equalTo: helloLabel.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            subLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(name:String){
        self.nameLabel.text = name
    }
}
