//
//  FirstCVC.swift
//  RendomColorCollectionView
//
//  Created by BCL-Device-12 on 14/11/22.
//

import UIKit
import Foundation

class FirstCVC: UICollectionViewCell {
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius  = 15
        }
    }
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    var seeAllPhotos: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        let nib = UINib(nibName: "SecondCVC", bundle: nil)
        secondCollectionView.register(nib, forCellWithReuseIdentifier: "secondCell")
        
        let snCollectionViewLayout = SNCollectionViewLayout()
        snCollectionViewLayout.fixedDivisionCount = 4 // Columns for .vertical, rows for .horizontal
        snCollectionViewLayout.delegate = self
        secondCollectionView.collectionViewLayout = snCollectionViewLayout
        
        shadowSetup()
    }

    
    func shadowSetup(){
        backView.layer.masksToBounds = false
        backView.layer.shadowRadius = 2
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOffset = CGSize(width: 0 , height: 0.3)
        
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

}

extension FirstCVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = secondCollectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as? SecondCVC else { return UICollectionViewCell() }
        
        cell.sampleView.backgroundColor = getRandomColor()
        
        if indexPath.row == 4 {
            cell.moreLbl.isHidden = false
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.row == 4{
            seeAllPhotos?()
        }
        
    }
}


extension FirstCVC: SNCollectionViewLayoutDelegate{
    func scaleForItem(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, atIndexPath indexPath: IndexPath) -> UInt {
        if indexPath.row == 0 || indexPath.row % 5 == 0 {
            return 2
        }
        return 1
    }

}

