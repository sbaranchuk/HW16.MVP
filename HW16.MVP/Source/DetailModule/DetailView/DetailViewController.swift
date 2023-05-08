//
//  DetailViewController.swift
//  HW16.MVP
//
//  Created by Admin on 07/05/2023.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController, DetailViewProtocol {

    // MARK: - Properties

    var presenter: DetailPresenterProtocol?

    //MARK: - UIElements

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var viewContatiner: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 40
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray2
        label.numberOfLines = 3
        return label
    }()

    private lazy var labelPrice: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.textAlignment = .center
        return label
    }()

    private lazy var labelAge: UILabel = {
        let label = UILabel()
        label.text = "Age"
        label.textAlignment = .center
        return label
    }()

    private lazy var labelSex: UILabel = {
        let label = UILabel()
        label.text = "Sex"
        label.textAlignment = .center
        return label
    }()

    private lazy var labelColor: UILabel = {
        let label = UILabel()
        label.text = "Color"
        label.textAlignment = .center
        return label
    }()

    private lazy var stackInformationTitle: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()

    private lazy var labelPriceData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var labelAgeData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var labelSexData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var labelColorData: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 15
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    private lazy var iconStars: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "stars")
        return imageView
    }()

    private lazy var buttonForNavigation: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarhy()
        setupLayout()
        configureView()
    }

    // MARK: - Setups

    private func setupView() {
        view.backgroundColor = .systemGray6

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "arrow"), style: .done, target: self, action: #selector(popView))
        navigationItem.leftBarButtonItem?.tintColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .done, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    private func setupHierarhy() {
        view.addSubview(imageView)
        view.addSubview(viewContatiner)
        viewContatiner.addSubview(titleLabel)
        viewContatiner.addSubview(descriptionLabel)
        viewContatiner.addSubview(stackInformationTitle)
        stackInformationTitle.addArrangedSubview(labelPrice)
        stackInformationTitle.addArrangedSubview(labelAge)
        stackInformationTitle.addArrangedSubview(labelSex)
        stackInformationTitle.addArrangedSubview(labelColor)
        viewContatiner.addSubview(labelPriceData)
        viewContatiner.addSubview(labelSexData)
        viewContatiner.addSubview(labelColorData)
        viewContatiner.addSubview(labelAgeData)
        viewContatiner.addSubview(iconStars)
    }

    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.height.equalTo(480)
        }

        viewContatiner.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(40)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(150)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(imageView.snp.leading).offset(50)
            make.top.equalTo(viewContatiner.snp.top).offset(30)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.top).offset(35)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(viewContatiner.snp.trailing).offset(-20)
        }

        stackInformationTitle.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).offset(50)
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.top.equalTo(viewContatiner.snp.bottom).offset(30)
        }

        labelPriceData.snp.makeConstraints { make in
            make.centerX.equalTo(labelPrice.snp.centerX)
            make.top.equalTo(labelPrice.snp.bottom).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }

        labelAgeData.snp.makeConstraints { make in
            make.centerX.equalTo(labelAge.snp.centerX)
            make.top.equalTo(labelAge.snp.bottom).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }

        labelSexData.snp.makeConstraints { make in
            make.centerX.equalTo(labelSex.snp.centerX)
            make.top.equalTo(labelSex.snp.bottom).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }

        labelColorData.snp.makeConstraints { make in
            make.centerX.equalTo(labelColor.snp.centerX)
            make.top.equalTo(labelColor.snp.bottom).offset(20)
            make.width.equalTo(60)
            make.height.equalTo(30)
        }

        iconStars.snp.makeConstraints { make in
            make.trailing.equalTo(viewContatiner.snp.trailing).offset(-60)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.width.equalTo(80)
            make.height.equalTo(20)
        }
    }

    // MARK: - Actions

    func configureView() {
        let animal = presenter?.model
        titleLabel.text = animal?.name
        descriptionLabel.text = animal?.description
        labelPriceData.text = (animal?.price ?? "0") + "$"
        labelAgeData.text = String(animal?.age ?? 0)
        imageView.image = UIImage(named: animal?.image ?? "heart")
        labelSexData.text = animal?.sex
        labelColorData.text = animal?.color
    }

    @objc func popView() {
        navigationController?.popViewController(animated: true)
    }

    @objc func addToFavorites() {
        if navigationItem.rightBarButtonItem?.tintColor == .white {
            navigationItem.rightBarButtonItem?.tintColor = .red
        } else {
            navigationItem.rightBarButtonItem?.tintColor = .white
        }
    }
}
