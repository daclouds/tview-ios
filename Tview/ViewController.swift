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
        
        let instance = Twitter.sharedInstance()
        if (instance.session() != nil) {
            instance.logInWithCompletion { session, error in
                instance.APIClient.loadUserWithID(session.userID) { (user, error) -> Void in
                    if (user != nil) {
                        dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
                            println(user?.profileImageURL)
                            let img = UIImage(data: NSData(contentsOfURL: NSURL(string:user!.profileImageURL)!)!)!
                            let rightBarButtonItem = UIBarButtonItem(
                                image: img.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate), style: UIBarButtonItemStyle.Plain, target: self, action: nil)
                            self.navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: true)
                        })
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

