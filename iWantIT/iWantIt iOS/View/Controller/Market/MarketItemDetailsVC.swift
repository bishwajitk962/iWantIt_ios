//
//  MarketItemDetailsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 11/06/24.
//

import UIKit

class MarketItemDetailsVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var cvItemsImages: UICollectionView!
    @IBOutlet weak var vwMoreOptionsPopup: UIView!
    @IBOutlet weak var vwNavBar: UIView!
    @IBOutlet weak var vwReportConfirmationPopup: UIView!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        cvItemsImages.delegate = self
        cvItemsImages.dataSource = self
        initialUISetup()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    //MARK: - IBAction
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func moreOptionsBtnAction(_ sender: UIButton) {
        if vwMoreOptionsPopup.isHidden {
            UIView.animate(withDuration: 0.3) {
                self.vwMoreOptionsPopup.alpha = 1
            } completion: { _ in
                self.vwMoreOptionsPopup.isHidden = false
            }
        } else {
            hideMoreOptions()
        }
    }
    @IBAction func reportBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.vwReportConfirmationPopup.alpha = 1
            self.vwReportConfirmationPopup.isHidden = false
        } completion: { _ in
            self.vwReportConfirmationPopup.isHidden = false
        }
    }
    @IBAction func reportNevermindBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.vwReportConfirmationPopup.alpha = 0
        } completion: { _ in
            self.vwReportConfirmationPopup.isHidden = true
        }
    }
    @IBAction func reportConfirmBtnAction(_ sender: UIButton) {
        vwReportConfirmationPopup.isHidden = true
        vwReportConfirmationPopup.alpha = 0
        
        if let reportVc = self.storyboard?.instantiateViewController(withIdentifier: "MarketPlaceReportVC") as? MarketPlaceReportVC {
            self.navigationController?.pushViewController(reportVc, animated: true)
        }
    }
    @IBAction func shareBtnAction(_ sender: UIButton) {
        shareItem()
    }
    
    @objc func tapAction() {
        hideMoreOptions()
    }
    
    func initialUISetup() {
        vwMoreOptionsPopup.isHidden = true
        vwMoreOptionsPopup.alpha = 0
        vwNavBar.layer.cornerRadius = 20
        vwNavBar.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        vwReportConfirmationPopup.isHidden = true
        vwReportConfirmationPopup.alpha = 0
    }
    
    func hideMoreOptions() {
        UIView.animate(withDuration: 0.3) {
            self.vwMoreOptionsPopup.alpha = 0
        } completion: { _ in
            self.vwMoreOptionsPopup.isHidden = true
        }
    }
    
    func shareItem() {
            let url = URL(string: "https://www.google.com")!
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityViewController.excludedActivityTypes = [.addToReadingList, .assignToContact]
            present(activityViewController, animated: true, completion: nil)
        }
    
}
//MARK: - CollectionView Delegate and DataSource
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
