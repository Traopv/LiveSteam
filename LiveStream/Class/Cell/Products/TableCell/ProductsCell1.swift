//
//  ProductsCell1.swift
//  LiveStream
//
//  Created by Apple on 10/27/20.
//  Copyright © 2020 ELSAGA-MACOS. All rights reserved.
//

import UIKit

class ProductsCell1: UITableViewCell {

    @IBOutlet weak var myCollection: UICollectionView!
    
    var collectionViewFlowLayout : UICollectionViewFlowLayout!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        myCollection.register(UINib.init(nibName: "ProductsCollCell", bundle: nil), forCellWithReuseIdentifier: "ProductsCollCell")
    }
}

//MARK:-
extension ProductsCell1: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollCell", for: indexPath) as! ProductsCollCell
        return cell
    }
}

//MARK:-
extension ProductsCell1: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = myCollection.bounds.width
        let height: CGFloat = myCollection.bounds.height
        let numberOfItemInRow : CGFloat = 3
        let numberOfRow : CGFloat = 2
        let iLineSpaing : CGFloat = 19
        let interItemSpacing : CGFloat = 22
        let iWidth = (width - (numberOfItemInRow - 1) * interItemSpacing) / numberOfItemInRow
        let iHeight = (height - (numberOfRow - 1) * iLineSpaing) / numberOfRow
        
        collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewFlowLayout.itemSize = CGSize(width: iWidth, height: iHeight)
        collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.minimumLineSpacing = iLineSpaing
        collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
        return CGSize(width: iWidth, height: iHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
