//
//  OuterCollectionView.swift
//  abc
//
//  Created by Audiology 5 on 24/01/19.
//  Copyright © 2019 Edureka. All rights reserved.
//

import UIKit

class OuterCollectionView: UICollectionViewController
{
     var scrolldisabledCollectionView : UICollectionView?
    
    override func viewDidLoad() {
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Innercell")
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       if(collectionView.restorationIdentifier == "Collection")
       {
        return 8;
        }
        else
       {
            return 15;
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView.restorationIdentifier == "Collection")
        {
            let ceil :UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            return ceil;
            
        }
            else if (collectionView.restorationIdentifier == "InnerMost")
        {
            let ceil :UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "innerMostCell", for: indexPath)
            return ceil;
        }
        else
        {
        let ceil :UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Innercell", for: indexPath)
        return ceil;
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //Checking if its not the inner collection view
        if(collectionView.restorationIdentifier == "InnerMost")
        {
            //scrolled till datasource.count -1 == 14 in our case
            if( indexPath.row == 14){
                
                               //Disabling the scrolling
                collectionView.isScrollEnabled = false;
                
                //Saved the collection view , so that the scrolling can be enabled later.
                scrolldisabledCollectionView = collectionView;
            }
        }

    }
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        if(collectionView?.restorationIdentifier != "InnerMost")
        {
            scrolldisabledCollectionView?.isScrollEnabled = true
        }
    }
    
}


