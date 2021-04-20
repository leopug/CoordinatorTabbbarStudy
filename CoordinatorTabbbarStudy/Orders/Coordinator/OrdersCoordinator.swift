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
    
    func goToOrder2Screen() -> Self  {
        (rootViewController as? UINavigationController)?.pushViewController(Orders2ViewController(coordinator: self), animated: false)
        return self
    }
    
    func goToOrder3Screen() -> Self {
        (rootViewController as? UINavigationController)?.pushViewController(Orders3ViewController(coordinator: self), animated: true)
        return self
    }
    
    
}
