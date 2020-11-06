//
//  HomeTableCell.swift
//  LiveStream
//
//  Created by Apple on 10/26/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {
    
    @IBOutlet weak var myCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:-
    //MARK: config
    func conFig(){
        myCollection.register(UINib.init(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
    }
}

//MARK:-
//MARK: collection
extension HomeTableCell : UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        cell.conFig()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  popupOrderView : PopupOrderView = PopupOrderView().fromNib(nibName: "PopupOrderView", index: 0) as! PopupOrderView
        popupOrderView.conFig()
        popupOrderView.frame = CGRect(x: 0, y: 0, width: VTConstants.ScreenSize.SCREEN_WIDTH, height: 400)
        popupOrderView.roundCorners([.topLeft, .topRight], radius: 15)
        popupOrderView.layer.masksToBounds = true
        let klc = KLCPopup.init(contentView: popupOrderView)
        popupOrderView.hiddenPopup = {
            klc?.dismissType = .bounceOutToBottom
            klc?.isHidden = true
        }
        klc?.showType = .bounceInFromBottom
        klc?.dismissType = .bounceOutToBottom
        klc?.maskType = .dimmed
        klc?.shouldDismissOnBackgroundTouch = true
        klc?.show(atCenter: CGPoint(x: VTConstants.ScreenSize.SCREEN_WIDTH / 2, y: VTConstants.ScreenSize.SCREEN_HEIGHT - 200), in: popupOrderView)
        klc?.show()
    }
}

//MARK:-
extension HomeTableCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = 219
        let height: CGFloat = 418
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

