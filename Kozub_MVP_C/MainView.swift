//
//  MainView.swift
//  Kozub_MVP_C
//
//  Created by Michael Kozub on 7/3/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import UIKit
import Anchorage

protocol MainViewDelegate: AnyObject {

    func buttonPressed()

}

class MainView: UIView {

    var theButton = UIButton()
    var theView = UIView()
    let screenSize: CGRect = UIScreen.main.bounds

    weak var delegate: MainViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupViews()
        setupConstraints()
        configureConstraints()
        addActions()

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViews() {
        self.addSubview(theButton)
        self.addSubview(theView)
    }

    func setupConstraints() {
        theButton.widthAnchor == self.widthAnchor / 2
        theButton.heightAnchor == 50
        theButton.centerXAnchor == self.safeAreaLayoutGuide.centerXAnchor
        theButton.bottomAnchor == self.safeAreaLayoutGuide.bottomAnchor - 20

        theView.widthAnchor == self.widthAnchor - 20
        theView.heightAnchor == 50
        theView.centerXAnchor == self.safeAreaLayoutGuide.centerXAnchor
        theView.topAnchor == self.safeAreaLayoutGuide.topAnchor + 20
        theView.bottomAnchor == self.safeAreaLayoutGuide.centerYAnchor
    }

    func configureConstraints() {
        theButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        theButton.setTitle("Tap to make Blue", for: .normal)
        theButton.layer.cornerRadius = 5

        theView.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        theView.layer.cornerRadius = 5
    }

    func addActions() {
        theButton.addTarget(self, action: #selector(self.onTapButton), for: .touchUpInside)
    }

    @objc func onTapButton() {
        delegate?.buttonPressed()
    }

    func render(props: Properties) {
        UIView.animate(withDuration: 0.5) {
            self.theView.backgroundColor = props.color
            self.theButton.setTitle(props.title, for: .normal)
        }
    }
}

struct Properties {
    var color: UIColor
    var title: String
}
