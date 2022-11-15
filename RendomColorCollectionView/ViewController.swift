//
//  ViewController.swift
//  RendomColorCollectionView
//
//  Created by BCL-Device-12 on 14/11/22.
//

import UIKit

class ViewController: UIViewController{
 
    let justView = UIView()
    
    @IBOutlet weak var collectionViewColor: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "FirstCVC", bundle: nil)
        collectionViewColor.register(nib, forCellWithReuseIdentifier: "cell")
        collectionViewColor.delegate = self
        collectionViewColor.dataSource = self
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewColor.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? FirstCVC else {return UICollectionViewCell() }
        cell.layer.cornerRadius = 20
        
        cell.layer.masksToBounds = false
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0 , height: 0.3)
        
        
        cell.seeAllPhotos = { [weak self] in
            guard let self = self  else {return}
            self.goOtherController()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 1.1, height: view.frame.height / 3.88)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        goOtherController()
    }
}



extension ViewController{
    func goOtherController(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "FullCV") as! FullCV
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
