//
//  ViewPresenter.swift
//  Kozub_MVP_C
//
//  Created by Michael Kozub on 7/3/19.
//  Copyright © 2019 Michael Kozub. All rights reserved.
//

import Foundation
import UIKit

class ViewPresenter {
    var model = TheModel(tapped: false)

    var buttonTitle: String {
        return model.tapped ? "Change to Orange" : "Change to Blue"
    }

    var buttonColor: UIColor {
        return model.tapped ? #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
    }

    func updateTapped() {
        model.tapped = !model.tapped
        let newProps = Properties(color: buttonColor, title: buttonTitle)
        onRender?(newProps)
    }
    
    init() {

    }

    var onRender: ((Properties) -> Void)?
}

struct TheModel {
    var tapped: Bool
}
