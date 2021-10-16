//
//  Orders3ViewController.swift
//  CoordinatorTabbbarStudy
//
//  Created by Leonardo Maia Pugliese on 20/04/21.
//

import UIKit

class Orders3ViewController: UIViewController, OrdersBaseCoordinated {
    
    var coordinator: OrdersBaseCoordinator?
    
    init(coordinator: OrdersBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
        title = "Orders 3"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGreen
    }
}
