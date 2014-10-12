//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Jayne Vidheecharoen on 10/9/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.textButton.frame.origin.y = 600
        self.photoButton.frame.origin.y =  600
        self.quoteButton.frame.origin.y =  600
        self.linkButton.frame.origin.y =  600
        self.chatButton.frame.origin.y =  600
        self.videoButton.frame.origin.y =  600

        
        
    }

    @IBAction func onNevermind(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.45
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            
            animateButton(photoButton, delayAmount: 0.1, endPosition: 140)
            animateButton(chatButton, delayAmount: 0.125, endPosition: 263)
            animateButton(quoteButton, delayAmount: 0.15, endPosition: 140)
            animateButton(textButton, delayAmount: 0.175, endPosition: 140)
            animateButton(linkButton, delayAmount: 0.2, endPosition: 263)
            animateButton(videoButton, delayAmount: 0.225, endPosition: 263)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                })
                { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            
            
            animateButton(photoButton, delayAmount: 0.1, endPosition: -200)
            animateButton(chatButton, delayAmount: 0.125, endPosition: -200)
            animateButton(quoteButton, delayAmount: 0.15, endPosition: -200)
            animateButton(textButton, delayAmount: 0.175, endPosition: -200)
            animateButton(linkButton, delayAmount: 0.2, endPosition: -200)
            animateButton(videoButton, delayAmount: 0.225, endPosition: -200)

            UIView.animateWithDuration(0.4, delay: 0.2, options: nil, animations: { () -> Void in
                fromViewController.view.alpha = 0
                
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }
    
    func animateButton(buttonName: UIButton, delayAmount: NSTimeInterval, endPosition: CGFloat){
        
        UIView.animateWithDuration(0.4, delay: delayAmount, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
            buttonName.frame.origin.y = endPosition
            }, completion: nil)
    }

}
