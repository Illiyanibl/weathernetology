//
//  MainViewCollectionCell.swift
//  weatherNetology
//
//  Created by Illya Blinov on 28.02.24.
//

import UIKit
final class MainViewCollectionCell: UICollectionViewCell {

    let weatherView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSubView(){
        contentView.addSubviews([weatherView])
        contentView.backgroundColor = .white
    }

    func setupCell(photo: String?) {
        guard let photo = photo else { return}
    }

    private func setupConstraints(){
        NSLayoutConstraint.activate([
            weatherView.topAnchor.constraint(equalTo: contentView.topAnchor),
            weatherView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            weatherView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            weatherView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

}
extension MainViewCollectionCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

}


