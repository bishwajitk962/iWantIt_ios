//
//  MarketItemDetailsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 11/06/24.
//

import UIKit

class MarketItemDetailsVC: UIViewController {
    @IBOutlet weak var cvItemsImages: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cvItemsImages.delegate = self
        cvItemsImages.dataSource = self
    }

}

extension MarketItemDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketItemsImageCVC", for: indexPath) as! MarketItemsImageCVC
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
}
