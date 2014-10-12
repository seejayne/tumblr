//
//  SearchViewController.swift
//  tumblr
//
//  Created by Jayne Vidheecharoen on 10/9/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var searchFeedView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var images = UIImage.animatedImageNamed("loading-", duration: 1)
        imageView.image = images
        
        searchFeedView.alpha = 0
        
        delay(2, closure: { () -> () in
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.searchFeedView.alpha = 1
            })
            
        })
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    
    

    
}
