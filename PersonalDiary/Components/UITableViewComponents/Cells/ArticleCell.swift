//
//  ArticleCell.swift
//  PersonalDiary
//
//  Created by out-nazarov2-ms on 02.10.2021.
//

import UIKit

class ArticleCell: Cell {
    let gap: CGFloat = 10

    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        imageView.heightAnchor.constraint(equalToConstant: 100 * verticalTranslation).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let content: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let created: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10 * verticalTranslation)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let updated: UILabel = {
        let label = UILabel()
        label.font = .italicSystemFont(ofSize: 10 * verticalTranslation)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var vstack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            title,
            image,
            content,
            updated,
            created
        ])
        stack.spacing = gap
        stack.setCustomSpacing(0, after: updated)
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func updateViews() {
        addSubviews()
        setupConstraints()

        guard let model = model as? CellModel else { return }
        content.text = model.content
        title.text = model.title
        created.text = "created at: \(model.creationDate.dateTime)"
        if model.creationDate != model.modificationDate {
            updated.text = "update at: \(model.modificationDate.dateTime)"
        } else  {
            updated.text = ""
        }
        
        if let data = model.image {
            image.image = UIImage(data: data)
        } else {
            image.image = nil
        }
    }

    func addSubviews() {
        contentView.addSubview(vstack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(lessThanOrEqualToConstant: 300 * verticalTranslation),
            vstack.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: gap),
            vstack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: gap),
            vstack.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -gap),
            vstack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -gap)
        ])
    }
}
