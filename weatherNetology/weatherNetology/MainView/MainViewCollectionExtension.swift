//
//  MainViewCollectionExtension.swift
//  weatherNetology
//
//  Created by Illya Blinov on 29.02.24.
import UIKit
extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    private var inset: CGFloat  { return 8}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: 42, height: 85)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return inset
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        24
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCollectionCell.identifier, for: indexPath) as! MainViewCollectionCell
       // let tap = UITapGestureRecognizer(target: self, action: #selector(test))
       // cell.photoView.addGestureRecognizer(tap)
       // cell.setupCell(photo: photo?[indexPath.item])
        return cell
    }
    

}
