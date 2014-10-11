//
//  TrendingViewController.swift
//  tumblr
//
//  Created by Jayne Vidheecharoen on 10/9/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = imageView.frame.size
    }

  }
