//
//  ViewController.swift
//  CollectionViewHeaders
//
//  Created by Gene Backlin on 5/11/18.
//  Copyright © 2018 Gene Backlin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextView: UITextView!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Main"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let controller: DetailCollectionViewController = segue.destination as! DetailCollectionViewController
            controller.titleText = titleTextField.text
            controller.subTitleText = subtitleTextView.text
        }
    }
    
}

