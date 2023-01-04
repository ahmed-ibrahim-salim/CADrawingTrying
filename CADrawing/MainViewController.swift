//
//  ViewController.swift
//  CADrawing
//
//  Created by Ahmad medo on 02/01/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var collectionV: UICollectionView!
    
    // data
    var dataSource = ["item 0", "item 1", "item 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        injectAutoScrollAnimation()
    }
}

// Continuous Auto Scroll With recursive Animation
extension MainViewController{
    func injectAutoScrollAnimation(){
        
        self.collectionV.register(UINib(nibName: "NewCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewCollectionViewCell")
        self.collectionV.delegate = self
        self.collectionV.dataSource = self
        
        // starting animation sequence
        autoScroll()
    }
    func autoScroll() {
        
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       // .curveLinear animation and allowing user interaction
                       options: [.curveLinear, .allowUserInteraction],
                       animations: {
            // doing animation in a block
            [weak self] in
            guard let self = self else {return}
            
            // animating (changing) contentoffset.x with new value
            self.collectionV.contentOffset.x += CGFloat(10)
        }, completion: {
            
            // when each animation completes calls func again
            [weak self] _ in
            guard let self = self else {return}
            
            self.autoScroll()
        })
    }

}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // using huge number for continuous scrolling
        return 1_000_000
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // returns remainder, explained down there
        print(dataSource[indexPath.row % dataSource.count], "index")
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCollectionViewCell", for: indexPath) as? NewCollectionViewCell else{fatalError()}
        
        /*
         getting index from list using remainder.
         Ex:
             (when clicking on SECOND ITEM after animation did 10 cycles)
             indexPath.row = 10
             data.count = 3
         then
            remainder(index in data) = indexPath.row % data.count = 10 % 3 = 1
         */
         
        let itemToShow = dataSource[indexPath.row % dataSource.count]
        
        cell.nameLbl.text = itemToShow
        
        return cell
    }
}

