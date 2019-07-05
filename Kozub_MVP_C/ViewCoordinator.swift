//
//  ViewCoordinator.swift
//  Kozub_MVP_C
//
//  Created by Michael Kozub on 7/3/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    /// Called to start a Coordinator. Presentation style (push, modal, etc) should be chosen/handled by the Coordinator.
    func start(from presentingViewController: UIViewController)
}

class ViewCoordinator: Coordinator {
    func start(from presentingViewController: UIViewController) {
//        let vc = ViewController.instantiate()
//        navigationController.pushViewController(vc, animated: false)
    }

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}
