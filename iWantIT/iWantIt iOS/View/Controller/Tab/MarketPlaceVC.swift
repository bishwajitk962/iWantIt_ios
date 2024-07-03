//
//  MarketPlaceVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 30/05/24.
//

import UIKit

class MarketPlaceVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var cvProductItems: UICollectionView!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvProductItems.delegate = self
        cvProductItems.dataSource = self
    }

}
//MARK: - CollectionView Delegate and DataSource
extension MarketPlaceVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MarketItemsCVC", for: indexPath) as! MarketItemsCVC
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.userInterfaceIdiom == .phone {
            // iPhone: 3 cells per row
            let collectionViewWidth = collectionView.bounds.width
            let spacing: CGFloat = 10
            let totalSpacing = spacing * 2 // (3 items - 1) * spacing
            let availableWidth = collectionViewWidth - totalSpacing
            let cellWidth = availableWidth / 3
            print(cellWidth)
            return CGSize(width: cellWidth, height: cellWidth+50)
        } else {
            // iPad: Fixed size
            return CGSize(width: 118, height: 168)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToNext(MarketItemDetailsVC.typeName, storyBoard:  StoryBoard.market)
    }
}
