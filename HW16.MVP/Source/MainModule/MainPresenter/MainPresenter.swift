//
//  MainPresenter.swift
//  HW16.MVP
//
//  Created by Admin on 24/04/2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
}

protocol MainPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, model: Animals)
}

class MainPresenter: MainPresenterProtocol {

    let view: MainViewProtocol
    let model: Animals

    required init(view: MainViewProtocol, model: Animals) {
        self.view = view
        self.model = model
    }
}
