//
//  ViewController.swift
//  Aug_24_CollectionView__CustomCell_Demo
//
//  Created by Vishal Jagtap on 10/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentsCollectionView: UICollectionView!
    var studentImages = [UIImage(named: "city_icon"),
                         UIImage(named: "city_icon"),
                         UIImage(named: "city_icon"),
                         UIImage(named: "city_icon"),
                         UIImage(named: "city_icon")]
    
    var studentNames = ["A", "B", "C", "D", "E"]
    var reuseIdentifierForStudentCollectionViewCell = "StudentCollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        registerCollectionViewCellWithCollectionView()
    }
    
    func initCollectionView(){
        studentsCollectionView.delegate = self
        studentsCollectionView.dataSource = self
    }
    
    func registerCollectionViewCellWithCollectionView(){
        let uiNib = UINib(nibName: "StudentCollectionViewCell", bundle: nil)
        self.studentsCollectionView.register(uiNib, forCellWithReuseIdentifier: "StudentCollectionViewCell")
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        studentImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let studentCOllectionViewCell = self.studentsCollectionView.dequeueReusableCell(withReuseIdentifier: "StudentCollectionViewCell", for: indexPath) as! StudentCollectionViewCell
        
//        print(studentImages[indexPath.item])
        studentCOllectionViewCell.studentImageView.image = studentImages[indexPath.item]
        studentCOllectionViewCell.studentNameLabel.text = studentNames[indexPath.item]

        return studentCOllectionViewCell
    }
}

extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let studentDetailsViewController = self.studentsCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForStudentCollectionViewCell, for: indexPath) as! StudentDetailsViewController
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = self.studentsCollectionView.frame.width
        let collectionViewHeight = self.studentsCollectionView.frame.height
        
       return CGSize(width: collectionViewWidth/3.0, height: collectionViewWidth/3.0)
    }
}
