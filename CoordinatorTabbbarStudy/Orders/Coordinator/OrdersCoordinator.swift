//
//  OrdersCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit

class OrdersCoordinator: OrdersBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: OrdersViewController(coordinator: self))
        return rootViewController
    }
    
    func moveTo(flow: AppFlow, userData: [String : Any]? = nil) {
        switch flow {
        case .orders(let screen):
            handleOrdersFlow(for: screen, userData: userData)
        default:
            parentCoordinator?.moveTo(flow: flow, userData: userData)
        }
    }
    
    private func handleOrdersFlow(for screen: OrdersScreen, userData: [String : Any]? = nil) {
        switch screen {
        case .firstScreen:
            resetToRoot(animated: false)
        case .secondScreen:
            handleGoToSecondScreen()
        case .thirdScreen:
            handleGoToThirdScreen()
        }
    }
    
    private func handleGoToSecondScreen() {
        resetToRoot(animated: false)
        navigationRootViewController?.pushViewController(Orders2ViewController(coordinator: self), animated: false)

    }
    
    private func handleGoToThirdScreen() {
        resetToRoot(animated: false)
        navigationRootViewController?.pushViewController(Orders2ViewController(coordinator: self), animated: false)
        navigationRootViewController?.pushViewController(Orders3ViewController(coordinator: self), animated: false)

    }
   
    @discardableResult
    func resetToRoot(animated: Bool) -> Self {
        navigationRootViewController?.popToRootViewController(animated: animated)
        return self
    }
}
