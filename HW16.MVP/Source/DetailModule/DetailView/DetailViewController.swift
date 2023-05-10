//
//  DetailViewController.swift
//  HW16.MVP
//
//  Created by Admin on 07/05/2023.
//

import UIKit

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

    private lazy var viewContainer: UIView = {
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
        label.setPreferences()
        return label
    }()

    private lazy var labelAgeData: UILabel = {
        let label = UILabel()
        label.setPreferences()
        return label
    }()

    private lazy var labelSexData: UILabel = {
        let label = UILabel()
        label.setPreferences()
        return label
    }()

    private lazy var labelColorData: UILabel = {
        let label = UILabel()
        label.setPreferences()
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

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "Arrow"), style: .done, target: self, action: #selector(popView))
        navigationItem.leftBarButtonItem?.tintColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "heart"), style: .done, target: self, action: #selector(addToFavorites))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    private func setupHierarhy() {
        view.addSubview(imageView)
        view.addSubview(viewContainer)
        viewContainer.addSubview(titleLabel)
        viewContainer.addSubview(descriptionLabel)
        viewContainer.addSubview(stackInformationTitle)

        let labelsForStack = [labelPrice, labelAge, labelSex, labelColor]
        labelsForStack.forEach() {
            stackInformationTitle.addArrangedSubview($0)
        }

        let labelsForViewCotainer = [labelPriceData, labelSexData, labelColorData, labelAgeData, iconStars]
        labelsForViewCotainer.forEach() {
            viewContainer.addSubview($0)
        }
    }

    private func setupLayout() {
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(480)
        }

        viewContainer.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(40)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(150)
        }

        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.leading).offset(50)
            $0.top.equalTo(viewContainer.snp.top).offset(30)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top).offset(35)
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.trailing.equalTo(viewContainer.snp.trailing).offset(-20)
        }

        stackInformationTitle.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(50)
            $0.trailing.equalTo(view.snp.trailing).offset(-50)
            $0.top.equalTo(viewContainer.snp.bottom).offset(30)
        }

        labelPriceData.snp.makeConstraints {
            $0.centerX.equalTo(labelPrice.snp.centerX)
            $0.top.equalTo(labelPrice.snp.bottom).offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }

        labelAgeData.snp.makeConstraints {
            $0.centerX.equalTo(labelAge.snp.centerX)
            $0.top.equalTo(labelAge.snp.bottom).offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }

        labelSexData.snp.makeConstraints {
            $0.centerX.equalTo(labelSex.snp.centerX)
            $0.top.equalTo(labelSex.snp.bottom).offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }

        labelColorData.snp.makeConstraints {
            $0.centerX.equalTo(labelColor.snp.centerX)
            $0.top.equalTo(labelColor.snp.bottom).offset(20)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }

        iconStars.snp.makeConstraints {
            $0.trailing.equalTo(viewContainer.snp.trailing).offset(-60)
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.width.equalTo(80)
            $0.height.equalTo(20)
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

extension UILabel {
    func setPreferences() {
        self.textAlignment = .center
        self.backgroundColor = .white
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 15
        self.font = .systemFont(ofSize: 14, weight: .semibold)
    }
}
