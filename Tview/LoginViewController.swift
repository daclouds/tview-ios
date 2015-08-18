//
//  LoginViewController.swift
//  Tview
//
//  Created by daclouds on 2015. 8. 18..
//
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let logInButton = TWTRLogInButton { (session, error) in
            // play with Twitter session
            if (session != nil) {
                println(session.userName)
            }
        }
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        dismissViewControllerAnimated(true, completion: nil)
    }

}
