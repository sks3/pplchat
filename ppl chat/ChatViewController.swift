//
//  ChatViewController.swift
//  ppl chat
//
//  Created by somi on 3/3/18.
//  Copyright © 2018 Somi Singh. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


  @IBOutlet var chatMessageField: UITextField!
  
  @IBOutlet var tableView: UITableView!
  @IBAction func sendMessage(_ sender: Any) {
    let chatMessage = PFObject(className: "Message")
    chatMessage["text"] = chatMessageField.text ?? ""
    chatMessage.saveInBackground { (success, error) in
      if success {
        print("Message was saved")
      } else {
        print("Error saving message: \(error?.localizedDescription)")
      }
    }
  }
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
    cell.selectionStyle = .none
    
    cell.chatMessageLabel.text = "asasdfasdfas"
    return cell
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
