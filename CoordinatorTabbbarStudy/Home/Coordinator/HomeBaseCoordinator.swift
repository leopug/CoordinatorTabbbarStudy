//
//  HomeCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit


protocol HomeBaseCoordinator: Coordinator {
    func goToHome2ScreenWith(title: String)
    func goToFavoritesFlow()
    func goToDeepViewInFavoriteTab()
}
