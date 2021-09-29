//
//  HospitalListCoordinator.swift
//  FastKes
//
//  Created by Farhandika on 29/09/21.
//  Copyright © 2021 TimZakarPina. All rights reserved.
//

import UIKit



final class HospitalListCoordinator:Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType  = .hospital
    
    func start() {
        getHospitalListVC()
    }
    
    func getHospitalListVC() {
        let hospitalListVC = HospitalListViewController()
        hospitalListVC.eventOccur = {[weak self]event in
            switch event {
            case .backToHome :
                self?.finish()
            }
        }
        navigationController.pushViewController(hospitalListVC, animated: true)
    }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit{
        print("being deinit")
    }
    
    
}
