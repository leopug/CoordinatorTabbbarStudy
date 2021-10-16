//
//  MainCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit

enum AppFlow {
    case home(HomeScreen)
    case orders(OrdersScreen)
}

enum HomeScreen {
    case initialScreen
    case doubleButtonScreen
}

enum OrdersScreen {
    case firstScreen
    case secondScreen
    case thirdScreen
}

class MainCoordinator: MainBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    
    lazy var homeCoordinator: HomeBaseCoordinator = HomeCoordinator()
    lazy var ordersCoordinator: OrdersBaseCoordinator = OrdersCoordinator()
    lazy var deepLinkCoordinator: DeepLinkBaseCoordinator = DeepLinkCoordinator(mainBaseCoordinator: self)
    
    lazy var rootViewController: UIViewController  = UITabBarController()
    
    func start() -> UIViewController {
        
        let homeViewController = homeCoordinator.start()
        homeCoordinator.parentCoordinator = self
        homeViewController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "homekit"), tag: 0)
        
        let ordersViewController = ordersCoordinator.start()
        ordersCoordinator.parentCoordinator = self
        ordersViewController.tabBarItem = UITabBarItem(title: "Orders", image: UIImage(systemName: "doc.plaintext"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [homeViewController,ordersViewController]
                
        return rootViewController
    }
        
    func moveTo(flow: AppFlow, userData: [String : Any]?) {
        switch flow {
        case .home:
            goToHomeFlow(flow)
        case .orders:
            goToOrdersFlow(flow)
        }
    }
    
    private func goToOrdersFlow(_ flow: AppFlow) {
        ordersCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 1
        
    }
    
    private func goToHomeFlow(_ flow: AppFlow) {
        homeCoordinator.moveTo(flow: flow, userData: nil)
        (rootViewController as? UITabBarController)?.selectedIndex = 0
        
    }
    
    func handleDeepLink(text: String) {
        deepLinkCoordinator.handleDeeplink(deepLink: text)
    }
    
    func resetToRoot() -> Self {
        homeCoordinator.resetToRoot(animated: false)
        moveTo(flow: .home(.initialScreen), userData: nil)
        return self
    }
    
}
