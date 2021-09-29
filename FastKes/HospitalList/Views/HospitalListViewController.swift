//
//  HospitalListViewController.swift
//  FastKes
//
//  Created by Farhandika on 29/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit

class HospitalListViewController: UIViewController {
    var eventOccur: ((HospitalListViewController.Events) -> Void)?
    var tableView:UITableView = {
        let tableView = UITableView()
        tableView.register(HospitalTableCell.self, forCellReuseIdentifier: HospitalTableCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgGreyPerf")
        view.addSubview(tableView)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Hospital List"
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15)
        ])
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
        if self.isMovingFromParent {
            print("we are being popped")
            eventOccur?(.backToHome)
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension HospitalListViewController {
    enum Events {
        case backToHome
    }
}


extension HospitalListViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: HospitalTableCell.identifier, for: indexPath) as? HospitalTableCell else { return UITableViewCell() }
        cell.configureSubView(title: "Nama Rumah Sakit", subTitle: "Jenis Rumah Sakit")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Makan bang \(indexPath.row)")
    }
    
}
