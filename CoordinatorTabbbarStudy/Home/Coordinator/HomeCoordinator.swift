//
//  HomeCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit

class HomeCoordinator: HomeBaseCoordinator {

    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UIViewController()
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: HomeViewController(coordinator: self))
        return rootViewController
    }
    
    func goToHome2ScreenWith(title: String) {
        let home2ViewController = Home2ViewController(coordinator: self)
        home2ViewController.title = title
        navigationRootViewController?.pushViewController(home2ViewController, animated: true)
    }
    
    func goToFavoritesFlow() {
        parentCoordinator?.moveTo(flow: .Favorites)
    }
    
    func goToDeepViewInFavoriteTab() {
        parentCoordinator?.moveTo(flow: .Favorites)
//        if let orderCoordinator = parentCoordinator?.ordersCoordinator,  orderCoordinator.navigationRootViewController?.viewControllers.last is Orders3ViewController {
//            parentCoordinator?.moveTo(flow: .Favorites)
//        } else {
            DispatchQueue.main.asyncAfter(deadline: .now()) { [weak self] in
                self?.parentCoordinator?.ordersCoordinator
                    .resetToRoot(animated: false)
            }
            DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
                self?.parentCoordinator?.ordersCoordinator
                    .goToOrder2Screen(animated: false)
                    .goToOrder3Screen(animated: false)
            }
        
    }
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
}
