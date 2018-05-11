//
//  DetailCollectionViewController.swift
//  CollectionViewHeaders
//
//  Created by Gene Backlin on 5/11/18.
//  Copyright © 2018 Gene Backlin. All rights reserved.
//

import UIKit

class DetailCollectionViewController: UICollectionViewController {
    var titleText: String?
    var subTitleText: String?
    
    var collectionViewHeader: CustomCollectionReusableView?

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Detail"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

// MARK: - UICollectionViewDataSource

extension DetailCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CustomCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        
        // Configure the cell
        
        cell.imageView.image = UIImage(named: "image")
        cell.titleLabel.text = "Title: \(indexPath.row)"
        cell.subtitleLabel.text = "Subtitle: \(indexPath.row)"
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        var headerView: CustomCollectionReusableView?
        
        if kind == UICollectionElementKindSectionHeader {
            headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CustomCollectionReusableView", for: indexPath) as? CustomCollectionReusableView
            headerView!.titleLabel.text = titleText
            headerView!.subtitleLabel.text = subTitleText
            collectionViewHeader = headerView
            collectionView.reloadSections(IndexSet(integer: indexPath.section))
        }
        
        return headerView!
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension DetailCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        var newSize: CGSize?
        
        if collectionViewHeader != nil {
            newSize = collectionViewHeader!.systemLayoutSizeFitting(collectionView.bounds.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        } else {
            newSize = CGSize(width: collectionView.bounds.width, height: 100.0)
        }
        return newSize!
    }
    
}
