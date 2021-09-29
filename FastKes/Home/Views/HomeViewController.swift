//
//  HomeViewController.swift
//  TabBarController+Coordinator
//
//  Created by Farhandika on 28/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    var eventOccur: ((HomeViewController.Events) -> Void)?
    
    let stupidUIView:UIView = {
        let uiView = UIView()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    let scrollView:UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.indicatorStyle = .black
        return scrollView
    }()
    
    let topView:TopHomeUIView = {
        let uiView = TopHomeUIView()
        uiView.configure(name: "Hadid")
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    let buttonContainer:UIView = {
        let uiView = UIView()
        uiView.layer.cornerRadius = 5
        uiView.layer.masksToBounds = true
        return uiView
    }()
    
    let stackViewTop:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    let secondUIView:UIView = {
        let uiView = UIView()
        uiView.backgroundColor = .white
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    let pesanButton: BigButton = {
        let button = BigButton()
        button.backgroundColor = .yellow
        button.configure(viewModel: MyCustomBigButton(title: "Phone",
                                                      imageName: "house", isSystemImage: true))
        return button
    }()
    
    let getHospitalButton: BigButton = {
        let button = BigButton()
        button.backgroundColor = .green
        button.configure(viewModel: MyCustomBigButton(title: "Hospital List",
                                                      imageName: "house", isSystemImage: true))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgGreyPerf")
        scrollView.delegate = self
        view.addSubview(scrollView)
        view.addSubview(stupidUIView)
        pesanButton.addTarget(self, action: #selector(pesanIsTapped(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: UIScreen.main.bounds.height+100)
        NSLayoutConstraint.activate([
            stupidUIView.topAnchor.constraint(equalTo: view.topAnchor),
            stupidUIView.heightAnchor.constraint(equalToConstant: view.bounds.width*0.117),
            stupidUIView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 900)
        ])
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        stackViewTop.addArrangedSubview(pesanButton)
        stackViewTop.addArrangedSubview(getHospitalButton)
        scrollView.addSubview(topView)
        scrollView.addSubview(buttonContainer)
        scrollView.addSubview(secondUIView)
        buttonContainer.addSubview(stackViewTop)
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.backgroundColor = .white
        NSLayoutConstraint.activate([
            topView
                .topAnchor
                .constraint(equalTo: scrollView.topAnchor),
            topView
                .leadingAnchor
                .constraint(equalTo: view.leadingAnchor),
            topView
                .trailingAnchor
                .constraint(equalTo: view.trailingAnchor),
            topView
                .heightAnchor
                .constraint(equalToConstant: view.bounds.height*0.3),
            buttonContainer
                .topAnchor
                .constraint(equalTo: topView.bottomAnchor,constant: 15),
            buttonContainer
                .trailingAnchor
                .constraint(equalTo: view.trailingAnchor,constant: -10),
            buttonContainer
                .leadingAnchor
                .constraint(equalTo: view.leadingAnchor,constant: 10),
            buttonContainer
                .heightAnchor
                .constraint(equalToConstant: view.bounds.height*0.2),
            stackViewTop
                .topAnchor
                .constraint(equalTo: buttonContainer.topAnchor,constant: 10),
            stackViewTop
                .bottomAnchor
                .constraint(equalTo: buttonContainer.bottomAnchor,constant: -10),
            stackViewTop
                .trailingAnchor
                .constraint(equalTo: buttonContainer.trailingAnchor,constant: -12),
            stackViewTop
                .leadingAnchor
                .constraint(equalTo: buttonContainer.leadingAnchor,constant: 12),
            secondUIView
                .topAnchor
                .constraint(equalTo: buttonContainer.bottomAnchor,constant: 15),
            secondUIView
                .trailingAnchor
                .constraint(equalTo: view.trailingAnchor,constant: -10),
            secondUIView
                .leadingAnchor
                .constraint(equalTo: view.leadingAnchor,constant: 10),
            secondUIView
                .heightAnchor
                .constraint(equalToConstant: 400)
        ])
    }
}


extension HomeViewController {
    enum Events {
        case pesan,cekHospital
    }
    
    @objc func pesanIsTapped(_:UIButton){
        eventOccur?(.pesan)
    }
    
    @objc func cekHospitalTapped(_:UIButton){
        eventOccur?(.cekHospital)
    }
}

extension HomeViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.scrollView.contentOffset.y > view.bounds.height*0.3 {
            self.stupidUIView.backgroundColor = .white
        } else {
            self.stupidUIView.backgroundColor = UIColor(named: "bgRed")
        }
    }
}
