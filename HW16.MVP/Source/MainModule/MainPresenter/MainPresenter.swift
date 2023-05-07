//
//  MainPresenter.swift
//  HW16.MVP
//
//  Created by Admin on 24/04/2023.
//

import Foundation

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var model: Animals { get }
    init(view: MainViewProtocol, model: Animals)
}

class MainPresenter: MainPresenterProtocol {
    weak var view: MainViewProtocol?
    var model: Animals

    required init(view: MainViewProtocol, model: Animals) {
        self.view = view
        self.model = model
    }
}
