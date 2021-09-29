//
//  HomeCoordinator.swift
//  TabBarController+Coordinator
//
//  Created by Farhandika on 28/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import Foundation
import UIKit

class HomeCoordinator:Coordinator, CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        switch childCoordinator.type {
        case .hospital :
            navigationController.viewControllers.removeAll()
            getHomeVC()
        default :
            break
        }
    }
    
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType {.home}
    
    func start() {
        getHomeVC()
    }
    
    func getHomeVC() {
        let homeVC = HomeViewController()
        homeVC.eventOccur = {[weak self] event in
            switch event {
            case .pesan:
                self?.getListHospitalVC()
            case .cekHospital:
                print("something cek hospotal")
            }
        }
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    func getListHospitalVC(){
        navigationController.navigationBar.isHidden = false
        let listHospitalCoordinator = HospitalListCoordinator(navigationController)
        listHospitalCoordinator.finishDelegate = self
        self.childCoordinators.append(listHospitalCoordinator)
        listHospitalCoordinator.start()
    }
    
    func getPesanVC() {
        
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
