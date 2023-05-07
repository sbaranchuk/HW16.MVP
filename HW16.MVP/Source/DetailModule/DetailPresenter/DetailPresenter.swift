//
//  DetailPresenter.swift
//  HW16.MVP
//
//  Created by Admin on 07/05/2023.
//

import Foundation

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
}

protocol DetailPresenterProtocol: AnyObject {
    var view: DetailViewProtocol? { get set }
    var model: Animal { get set }
    init(view: DetailViewProtocol, model: Animal)
}

class DetailPresenter: DetailPresenterProtocol {
    weak var view: DetailViewProtocol?
    var model: Animal

    required init(view: DetailViewProtocol, model: Animal) {
        self.view = view
        self.model = model
    }
}
