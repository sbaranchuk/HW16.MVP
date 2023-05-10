//
//  CategoryCell.swift
//  HW16.MVP
//
//  Created by Admin on 06/05/2023.
//

import UIKit

final class CategoryCell: UICollectionViewCell {

    static var identifier = "CategoryCell"

    //MARK: - Outlets

    private lazy var viewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private lazy var titleLable: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarhy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in CategoryCell")
    }

    //MARK: - Setups

    private func setupHierarhy() {
        addSubview(viewContainer)
        viewContainer.addSubview(imageView)
        addSubview(titleLable)
    }

    private func setupLayout() {
        viewContainer.snp.makeConstraints {
            $0.top.leading.equalTo(self)
            $0.height.width.equalTo(83)
        }

        imageView.snp.makeConstraints {
            $0.centerX.equalTo(viewContainer.snp.centerX)
            $0.centerY.equalTo(viewContainer.snp.centerY)
        }

        titleLable.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.centerX.equalTo(imageView.snp.centerX)
        }
    }

    func configuration(animal: Animal) {
        titleLable.text = animal.name
        imageView.image = UIImage(named: animal.image)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLable.text = nil
        self.imageView.image = nil
    }
}
