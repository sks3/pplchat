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


  var messages: [PFObject] = []
  
  @IBOutlet var chatMessageField: UITextField!
  @IBOutlet var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.rowHeight = 40
    
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.loadMessages), userInfo: nil, repeats: true)
                         
    // Do any additional setup after loading the view.
  }
  
  @IBAction func signOutUser(_ sender: Any) {
    PFUser.logOut()
    dismiss(animated: true, completion: nil)
  }
  
  @objc func loadMessages() {
    let query = PFQuery(className: "Message")
    query.addDescendingOrder("createdAt")
 
    query.findObjectsInBackground { (messages: [PFObject]?, error: Error?) in
      if let messages = messages {
        self.messages = messages
        self.tableView.reloadData()
          
        }
      else {
        print(error?.localizedDescription)
      }
    }
  }
  
  
  
  
  @IBAction func sendMessage(_ sender: Any) {
    let chatMessage = PFObject(className: "Message")
    chatMessage["text"] = chatMessageField.text ?? ""
    chatMessage["user"] = PFUser.current()
    chatMessage["username"] = PFUser.current()?.username
    chatMessage.saveInBackground { (success, error) in
      if success {
        print("Message was saved")
      } else {
        print("Error saving message: \(error?.localizedDescription)")
      }
    }
  }
  
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
    cell.selectionStyle = .none
    cell.chatMessageLabel.text = messages[indexPath.row]["text"] as! String?
    cell.chatMessageUser.text = messages[indexPath.row]["username"] as! String?
    
    return cell
  }
  


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
