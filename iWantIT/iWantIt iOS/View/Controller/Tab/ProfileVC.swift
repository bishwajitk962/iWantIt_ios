//
//  ProfileVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 29/05/24.
//

import UIKit

struct ProductCategories {
    var isSelected : Bool = false
    var image : UIImage?
    var name : String?
}

class ProfileVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var lblUsrname: UILabel!
    @IBOutlet weak var lblUserFullName: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var collVwProducts: UICollectionView!
    @IBOutlet weak var collVwCategories: UICollectionView!
    @IBOutlet weak var contHeightcollVwCategories: NSLayoutConstraint!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnImSellingIt: UIButton!
    @IBOutlet weak var btnIwant: UIButton!
    @IBOutlet weak var vwSliderSelling: UIView!
    @IBOutlet weak var vWSliderWant: UIView!
    
    var productCategoriesArray = [ProductCategories(image: UIImage(named: "furniture_filter_icon") ?? UIImage(),name: "Furniture"),
                                  ProductCategories(image: UIImage(named: "sublease_filter_icon") ?? UIImage(), name: "Sublease"),
                                  ProductCategories(image: UIImage(named: "tickets_filter_icon") ?? UIImage(), name: "Tickets"),
                                  ProductCategories(image: UIImage(named: "clothes_filter_icon") ?? UIImage(), name: "Clothes"),
                                  ProductCategories(image: UIImage(named: "other_filter_icon") ?? UIImage(), name: "Other"),
                                  ]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
        vWSliderWant.backgroundColor = .clear
        
    }
    //MARK: - IBAction
    @IBAction func settingBtnAction(_ sender: UIButton) {
        moveToNext(SettingsVC.typeName , storyBoard: StoryBoard.setting)
    }
    
    @IBAction func actionFilter(_ sender: UIButton) {
        sender.isSelected.toggle()
        contHeightcollVwCategories.constant = sender.isSelected ? 0 : 80
    }
    
    @IBAction func actionSellingAndWant(_ sender: UIButton) {
        if sender == btnImSellingIt {
             btnImSellingIt.setTitleColor(UIColor.black, for: .normal)
             btnIwant.setTitleColor(UIColor.gray, for: .normal)
             vWSliderWant.backgroundColor = .clear
             vwSliderSelling.backgroundColor = UIColor.appTheme
         } else if sender == btnIwant {
             btnIwant.setTitleColor(UIColor.black, for: .normal)
             btnImSellingIt.setTitleColor(UIColor.gray, for: .normal)
             vwSliderSelling.backgroundColor = .clear
             vWSliderWant.backgroundColor = UIColor.appTheme
         }
    }
    
}
//MARK: - other methods
extension ProfileVC {
    func initialUISetup() {
        collVwCategories.register(UINib(nibName: "ProductCategoriesCVC", bundle: nil), forCellWithReuseIdentifier: "ProductCategoriesCVC")
        lblUsrname.font = UIFont(name: "Cabin Bold", size: 18)
        lblUserFullName.font = UIFont(name: "Cabin Regular", size: 18)
    }
}

// MARK: - CollectionView
//extension ProfileVC:UICollectionViewDelegate,UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 6
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImSellingITCVC", for: indexPath) as! ImSellingITCVC
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("Select::",indexPath.row)
//    }
//
//}


//MARK: - CollectionView Delegate and DataSource
extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collVwCategories {
            return productCategoriesArray.count
        }else {
            return 6
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collVwCategories {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCategoriesCVC", for: indexPath) as! ProductCategoriesCVC
            cell.imgCategories.image = productCategoriesArray[indexPath.row].image
            cell.lblCategoriesName.text = productCategoriesArray[indexPath.row].name
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImSellingITCVC", for: indexPath) as! ImSellingITCVC
            return cell
        }
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
//        moveToNext(MarketItemDetailsVC.typeName, storyBoard:  StoryBoard.market)
    }
}

