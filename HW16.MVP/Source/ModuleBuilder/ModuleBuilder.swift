//
//  ModuleBuilder.swift
//  HW16.MVP
//
//  Created by Admin on 01/05/2023.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModileBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Animals()
        let view = MainViewController()
        let presenter = MainPresenter(view: view, model: model)
        view.presenter = presenter
        return view
    }
}
