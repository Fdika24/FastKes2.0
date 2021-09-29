//
//  NewsUIView.swift
//  FastKes
//
//  Created by Farhandika on 29/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit

class NewsUIView: UIView {
    
    let stackView:UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
