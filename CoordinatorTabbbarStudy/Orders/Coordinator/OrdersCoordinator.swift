//
//  OrdersCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit

class OrdersCoordinator: OrdersBaseCoordinator {
    
    func goToPendingOrdersScreen() {
        print("go to pending orders screen")
    }
    
    var parentCoordinator: MainBaseCoordinator?
    
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: OrdersViewController(coordinator: self))
        return rootViewController
    }
    
    func goToOrder2Screen(animated: Bool = false) -> Self  {
        navigationRootViewController?.pushViewController(Orders2ViewController(coordinator: self), animated: animated)
        return self
    }
    
    func goToOrder3Screen(animated: Bool = false) -> Self {
        navigationRootViewController?.pushViewController(Orders3ViewController(coordinator: self), animated: animated)
        return self
    }
    
    
}
