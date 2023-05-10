//
//  PetCell.swift
//  HW16.MVP
//
//  Created by Admin on 06/05/2023.
//

import UIKit

final class PetCell: UICollectionViewCell {

    static var identifier = "PetCell"

    //MARK: - Outlets

    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 45
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 45
        return imageView
    }()

    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()

    private lazy var favoritesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
        button.layer.cornerRadius = 25
        return button
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()

    private lazy var iconCart: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "cart")
        imageView.image = image
        return imageView
    }()

    private lazy var buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    private lazy var iconHeart: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "heart.fill")
        imageView.image = image
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var iconReting: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = UIImage(named: "stars")
        return imageView
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarhy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in PetCell")
    }

    //MARK: - Setups

    private func setupHierarhy() {
        contentView.addSubview(viewContainer)
        viewContainer.addSubview(imageView)
        viewContainer.addSubview(favoritesButton)
        viewContainer.addSubview(titleLable)
        viewContainer.addSubview(priceLabel)
        viewContainer.addSubview(descriptionLabel)
        viewContainer.addSubview(iconCart)
        viewContainer.addSubview(buttonAdd)
        viewContainer.addSubview(iconHeart)
        viewContainer.addSubview(iconReting)
    }

    private func setupLayout() {
        viewContainer.snp.makeConstraints {
            $0.top.equalTo(self).offset(15)
            $0.leading.equalTo(self)
            $0.height.equalTo(142)
            $0.trailing.equalTo(self)
        }

        imageView.snp.makeConstraints {
            $0.leading.equalTo(viewContainer.snp.leading)
            $0.top.equalTo(viewContainer.snp.top)
            $0.height.width.equalTo(142)
        }

        favoritesButton.snp.makeConstraints {
            $0.height.width.equalTo(50)
            $0.trailing.equalTo(viewContainer.snp.trailing)
            $0.top.equalTo(viewContainer.snp.top)
        }

        titleLable.snp.makeConstraints {
            $0.top.equalTo(viewContainer.snp.top).offset(20)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }

        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom).offset(8)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.trailing.equalTo(viewContainer.snp.trailing).offset(-20)
        }

        priceLabel.snp.makeConstraints {
            $0.bottom.equalTo(viewContainer.snp.bottom).offset(-10)
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
        }

        iconCart.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel.snp.centerY)
            $0.trailing.equalTo(viewContainer.snp.trailing).offset(-65)
            $0.width.height.equalTo(20)
        }

        buttonAdd.snp.makeConstraints {
            $0.centerY.equalTo(iconCart.snp.centerY)
            $0.leading.equalTo(iconCart.snp.trailing).offset(10)
        }

        iconHeart.snp.makeConstraints {
            $0.centerX.equalTo(favoritesButton.snp.centerX)
            $0.centerY.equalTo(favoritesButton.snp.centerY)
            $0.height.equalTo(27)
            $0.width.equalTo(30)
        }

        iconReting.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(10)
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            $0.height.equalTo(12)
            $0.width.equalTo(48)
        }
    }

    //MARK: - Action

    @objc func addToFavorites() {
        if favoritesButton.backgroundColor == .gray  {
            favoritesButton.backgroundColor = .red
        } else {
            favoritesButton.backgroundColor = .gray
        }
    }

    // MARK: - Configuration

    func configuration(animal: Animal) {
        titleLable.text = animal.name
        descriptionLabel.text = animal.description
        imageView.image = UIImage(named: animal.image)
        priceLabel.text = (animal.price ?? "0") + "$"
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLable.text = nil
        self.descriptionLabel.text = nil
        self.imageView.image = nil
        self.priceLabel.text = nil
    }
}
