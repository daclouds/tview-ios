//
//  ReviewViewController.swift
//  Tview
//
//  Created by daclouds on 2015. 8. 10..
//
//

import UIKit

import Parse

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var review = Review?()
    var seriesId: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let review = review {
            comment.text = review.comment
        }
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
        if saveButton === sender {
            save(sender as! UIBarButtonItem)
            
        }
    }
    
    @IBAction func save(sender: UIBarButtonItem) {
        let _review = PFObject(className: "Review")
        _review["seriesId"] = seriesId
        _review["comment"] = comment.text
        _review["author"] = "anonymous"
        _review.saveInBackgroundWithBlock({ (success: Bool, error: NSError?) -> Void in
            var alert: UIAlertView
            if (success) {
                let message = "Object has been saved."
                self.review = Review(seriesId: self.seriesId!, objectId: _review.objectId!, comment: self.comment.text, author: "anonymous")
                alert = UIAlertView(title: "Success", message: message, delegate: self, cancelButtonTitle: "Close")
            } else {
                alert = UIAlertView(title: "Error", message: error?.description, delegate: self, cancelButtonTitle: "Close")
            }
            alert.show()
        })
        
        
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddReviewMode = presentingViewController is UINavigationController
        if isPresentingInAddReviewMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }

    }
    
}
