//
//  MessagingViewController.swift
//  IconicApp
//
//  Created by Fabrice Mulumba on 11/4/18.
//  Copyright © 2018 Fabrice Mulumba. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth


class ReceivedMessageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
 
    var message: Message!
    var messages = [Message]()
    
    
    
    var imagePicker : UIImagePickerController! 

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        imagePicker = UIImagePickerController()
        
    
        
        
        //-----------------------------------------------------------------------------------------------
        
        DataService.ds.REF_RECEIVED_MESSAGES.observe(.value, with: { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                
                self.messages.removeAll() //Clears posts so no duplicates occur whenever the page reloads
                
                for snap in snapshot {
                    print("SNAP: \(snap)") //Prints all snapshots
                    if let messageDict = snap.value as? Dictionary<String, AnyObject> {
                        
                        let id = snap.key
                        let message = Message(messageKey: id, messageData: messageDict)
                        self.messages.append(message)
                    }
                }
                
            }
            
            self.tableView.reloadData() //Need this
            
        })
        
    }

    
    //------------------------------------------------Video Feed-----------------------------------------------
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        
        return messages.count
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //return UITableViewCell()
        
            message = messages[indexPath.row]
    
        
        print(message.iconUrl)
        
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "receivedMessageCell") as? ReceivedMessageCell {
            
            
            cell.configureCell(message: message)
            
            
            return cell
            
        } else {
            return ReceivedMessageCell()
        }
        
    }

}
