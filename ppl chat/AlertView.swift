//
//  AlertView.swift
//  ppl chat
//
//  Created by somi on 3/3/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit

class AlertView: NSObject {
  
  class func viewAlert(view: UIViewController, title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(OKAction)
    view.present(alert, animated:  true, completion: nil)
  }
}
