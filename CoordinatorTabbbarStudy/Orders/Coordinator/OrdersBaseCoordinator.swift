//
//  OrdersBaseCoordinator.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 19/04/21.
//

import UIKit

protocol OrdersBaseCoordinator: Coordinator {
    @discardableResult func goToOrder2Screen(animated: Bool ) -> Self
    @discardableResult func goToOrder3Screen(animated: Bool) -> Self
}
