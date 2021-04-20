//
//  HomeCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit

class HomeCoordinator: HomeBaseCoordinator {
    
    func resetToRoot() -> Self {
        navigationRootViewController?.popToRootViewController(animated: false)
        return self
    }
    

    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    lazy var navigationViewController: UINavigationController? = {
        (rootViewController as? UINavigationController)
    }()
    
    
    func start() -> UIViewController {
        rootViewController = UINavigationController(rootViewController: HomeViewController(coordinator: self))
        return rootViewController
    }
    
    func goToHome2ScreenWith(title: String) {
        let home2ViewController = Home2ViewController(coordinator: self)
        home2ViewController.title = title
        navigationRootViewController?.pushViewController(home2ViewController, animated: true)

    }
    
    func goToHome2Screen() {
    }
    
    func goToFavoritesFlow() {
        parentCoordinator?.moveTo(flow: .Favorites)
    }
    
    func goToDeepViewInFavoriteTab() {
        parentCoordinator?.moveTo(flow: .Favorites)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1) { [weak self] in
            self?.parentCoordinator?.ordersCoordinator
                .resetToRoot()
                .goToOrder2Screen(animated: true)
                .goToOrder3Screen(animated: true)
        }
    }
}
