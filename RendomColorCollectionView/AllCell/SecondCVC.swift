//
//  SecondCVC.swift
//  RendomColorCollectionView
//
//  Created by BCL-Device-12 on 14/11/22.
//

import UIKit

class SecondCVC: UICollectionViewCell {

    @IBOutlet weak var sampleView: UIView!
    
  
    @IBOutlet weak var moreLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moreLbl.isHidden = true
    }

}
