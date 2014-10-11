//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Jayne Vidheecharoen on 10/9/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!


    var tappedButton : UIButton!
    var currentView : String!

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!

    @IBOutlet weak var composeButton: UIButton!
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
    }
    
    @IBAction func onTap(sender: AnyObject) {

        tappedButton = sender as UIButton
        
        //tappedButton.selected = !tappedButton.selected
        
        
        if tappedButton == homeButton{
            homeViewController.view.frame = contentView.frame
            contentView.addSubview(homeViewController.view)
            currentView = "home"
        
        } else if tappedButton == searchButton {
            searchViewController.view.frame = contentView.frame
            contentView.addSubview(searchViewController.view)
            currentView = "search"
 
        } else if tappedButton == accountButton {
            accountViewController.view.frame = contentView.frame
            contentView.addSubview(accountViewController.view)
            currentView = "account"
        
        } else if tappedButton == trendingButton {
            trendingViewController.view.frame = contentView.frame
            contentView.addSubview(trendingViewController.view)
            currentView = "trending"
        }
        
        // button states
        
        if currentView == "home"{
            homeButton.selected = true
        } else {
            homeButton.selected = false
        }
        
        if currentView == "search"{
            searchButton.selected = true
        } else {
            searchButton.selected = false
        }
        
        if currentView == "account"{
            accountButton.selected = true
        } else {
            accountButton.selected = false
        }
        
        if currentView == "trending"{
            trendingButton.selected = true
        } else {
            trendingButton.selected = false
        }
        
    }
    
    
}
