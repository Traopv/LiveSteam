//
//  PopupOrderView.swift
//  AppSales
//
//  Created by Apple on 10/22/20.
//

import UIKit

class PopupOrderView: UIView {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    @IBOutlet weak var myCollection1: UICollectionView!
    @IBOutlet weak var myCollection2: UICollectionView!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    
    let arrTitleColor = ["Đen","Trắng","Hồng","Xanh"]
    let arrColor = ["333333","FFFFFF","FF98C3","9AC2FF"]
    let arrSize = ["S","M","L","XL"]
    var indexColor = 0
    var indexSize = 0
    var hiddenPopup : (() -> Void)?
    
    var number : Int = 0
    {
        didSet{
            lbNumber.text = "\(number)"
        }
    }
    var title : String?
    var dicription : String?
    var image : String?
    var points : Int?
    var oldPrices : Double?
    var newPrices : Double?
    var color : String?
    var isize : String?
    var time : Date?
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        myCollection1.register(UINib.init(nibName: "PopupOderCell1", bundle: nil), forCellWithReuseIdentifier: "PopupOderCell1")
        myCollection2.register(UINib.init(nibName: "PopupOrderCell2", bundle: nil), forCellWithReuseIdentifier: "PopupOrderCell2")
        btnAddToCart.layer.cornerRadius = 2.0
        btnAddToCart.layer.masksToBounds = true
        
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func removeNumber(_ sender: Any) {
        if number == 0 {
            
        } else {
            number -= 1
        }
    }
    @IBAction func addNumber(_ sender: Any) {
        number += 1
    }
    @IBAction func addToCart(_ sender: Any) {
        if color == nil || size == nil || number == 0 {
            VTBase.showToastWithMessage(message: "Chọn đầy đủ thông tin của sản phẩm!")
        } else {
            title = "Áo nữ thu đông dáng Nhật Bản"
            dicription = "Nano là loại vải tính năng mới, có khả năng thấm hút mồ hôi vượt trội, nhanh khô và thoát ẩm, cảm giác mát lạnh mỗi khi mặc."
            points = 90
            image = "37571712310ad644e1657ce21be1c1d4 2.png"
            oldPrices = 150000.0
            newPrices = 120000.0
            time = Date()
            AppManager.shared.arrProducts.append(Products(name: title ?? "", dicription: dicription ?? "", image: image ?? "", points: points ?? 0, oldPrices: oldPrices ?? 0, newPrices: newPrices ?? 0, color: color ?? "", size: isize ?? "", time: time ?? Date(), number: number))
            hiddenPopup?()
        }
    }
}

//MARK:-
//MARK: collection
extension PopupOrderView : UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = 4
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if collectionView == self.myCollection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupOderCell1", for: indexPath) as! PopupOderCell1
            let titleColor = arrTitleColor[indexPath.row]
            cell.viewCell.backgroundColor = UIColor.init(hex: arrColor[indexPath.row])
            cell.lbName.text = titleColor
            cell.conFig()
            
            if indexPath.row == indexColor {
                cell.imgCell.isHidden = false
            } else {
                cell.imgCell.isHidden = true
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupOrderCell2", for: indexPath) as! PopupOrderCell2
            cell.conFig()
            let typeSize = arrSize[indexPath.row]
            cell.lbSize.text = typeSize
            
            if indexPath.row == indexSize {
                cell.viewCell.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.3411764706, blue: 0.3411764706, alpha: 1)
                cell.lbSize.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                cell.viewCell.backgroundColor = #colorLiteral(red: 0.8784313725, green: 0.8784313725, blue: 0.8784313725, alpha: 1)
                cell.lbSize.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
            }
            return cell
        }
        return UICollectionViewCell.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.myCollection1 {
            indexColor = indexPath.row
            color = arrTitleColor[indexColor]
            myCollection1.reloadData()
        } else {
            indexSize = indexPath.row
            isize = arrSize[indexSize]
            myCollection2.reloadData()
        }
    }
}

//MARK:-
extension PopupOrderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width : CGFloat = 40
        var height: CGFloat = 52
        if collectionView == self.myCollection1 {
            width = 40
            height = 56
        } else {
            width = 40
            height = 40
        }
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
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
