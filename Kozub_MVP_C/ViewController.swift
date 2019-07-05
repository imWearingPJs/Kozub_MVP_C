//
//  ViewController.swift
//  Kozub_MVP_C
//
//  Created by Michael Kozub on 7/3/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

class ViewController: UIViewController, MainViewDelegate {

    func buttonPressed() {
        presenter.updateTapped()
    }

    let presenter: ViewPresenter
    var mainView = MainView()

    var theButton = UIButton()
    var theView = UIView()
    let screenSize: CGRect = UIScreen.main.bounds

    init(with presenter: ViewPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "First ViewController"

        mainView.delegate = self
    }

    override func loadView() {
        self.view = mainView
    }

    func render(props: Properties) {
        mainView.render(props: props)
    }

}
