//
//  ViewController.swift
//  HW16.MVP
//
//  Created by Admin on 24/04/2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    // MARK: - Properties

    var presenter: MainPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

extension MainViewController: MainViewProtocol {
}
