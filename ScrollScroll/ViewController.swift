//
//  ViewController.swift
//  ScrollScroll
//
//  Created by Erick Alcantara on 2/6/19.
//  Copyright © 2019 Erick Alcantara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet var scrollTextField: [UITextField]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      // registerForKeyboardNotifications()
      
     
        
    
}

    //MARK: Keyboard Notifications
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWasShown(_:)),
            name: UIResponder.keyboardDidShowNotification,
            object: nil);
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillBeHidden(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil);
    }
    
    @objc func keyboardWasShown(_ notification: NSNotification) {
        guard let info: [AnyHashable: Any] = notification.userInfo,
            let keyboardFrameValue: NSValue = info[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue else {
                return;
        }
        
        let height: CGFloat = keyboardFrameValue.cgRectValue.size.height;
        let contentInsets: UIEdgeInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: height, right: 0.0);
        scrollView.contentInset = contentInsets;
        scrollView.scrollIndicatorInsets = contentInsets;
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {
        scrollView.contentInset = .zero;
        scrollView.scrollIndicatorInsets = .zero;
    }
    
    @IBAction func returnKeyTapped(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
    
  
}

