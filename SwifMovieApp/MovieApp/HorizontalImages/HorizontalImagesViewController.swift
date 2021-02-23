//
//  HorizontalImagesViewController.swift
//  MovieApp
//
//  Created by Franklin Samboni on 23/02/21.
//

import UIKit

class HorizontalImagesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var images: [String] =  []
    private var onItemTap: (() -> Void)! = nil
    
    private let cellId = "ImageCellCollectionViewCell"
    
    convenience init(images: [String], onItemTap: @escaping () -> Void) {
        self.init()
        self.images = images
        self.onItemTap = onItemTap
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }

}

extension HorizontalImagesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ImageCellCollectionViewCell
        
        cell.image.image = UIImage(named: images[indexPath.row])
        return cell
    }
}

extension HorizontalImagesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onItemTap()
    }
    
}

