//
//  ViewController.swift
//  Tview
//
//  Created by daclouds on 2015. 7. 3..
//
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Twitter.sharedInstance().logInWithCompletion { session, error in
            Twitter.sharedInstance().APIClient.loadUserWithID(session.userID) { (user, error) -> Void in
                if (user != nil) {
                    var profileImg: UIImage?
                    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                        profileImg =  UIImage(data: NSData(contentsOfURL: NSURL(string:user!.profileImageURL)!)!)!
                        println(user?.profileImageURL)
                    })
                    self.navigationItem.setRightBarButtonItem(UIBarButtonItem(image: profileImg, style: UIBarButtonItemStyle.Plain, target: self, action: ""), animated: false)
                    println(session.userName)
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

