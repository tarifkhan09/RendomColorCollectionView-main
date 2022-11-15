//
//  FullCV.swift
//  RendomColorCollectionView
//
//  Created by BCL-Device-12 on 14/11/22.
//

import UIKit

class FullCV: UIViewController {

    @IBOutlet weak var fullCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullCollectionView.delegate = self
        fullCollectionView.dataSource = self
        let nib = UINib(nibName: "SecondCVC", bundle: nil)
        fullCollectionView.register(nib, forCellWithReuseIdentifier: "secondCell")
        
        
        let snCollectionViewLayout = SNCollectionViewLayout()
        snCollectionViewLayout.fixedDivisionCount = 4 // Columns for .vertical, rows for .horizontal
        snCollectionViewLayout.delegate = self
        fullCollectionView.collectionViewLayout = snCollectionViewLayout

    }

    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
}

extension FullCV: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = fullCollectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as? SecondCVC else {return UICollectionViewCell() }
        cell.sampleView.backgroundColor = getRandomColor()
        return cell
    }
    
   
}

extension FullCV: SNCollectionViewLayoutDelegate{
    func scaleForItem(inCollectionView collectionView: UICollectionView, withLayout layout: UICollectionViewLayout, atIndexPath indexPath: IndexPath) -> UInt {
//        
//        if indexPath.row == 0 {
//            return 4
//        }
            
        return 1
    }
}
