//
//  IconicApp
//
//  Created by Fabrice Mulumba on 11/4/18.
//  Copyright © 2018 Fabrice Mulumba. All rights reserved.
//




import Foundation
import UIKit
import Firebase


class ReceivedMessageCell: UITableViewCell {
    
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var messageBodyLabel: UILabel!
    
    @IBOutlet weak var receivedIconImage: UIImageView!

    var message: Message!

    
    func downloadImage(urlString: String, imageView: UIImageView) {
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { // Make sure you're on the main thread here
                imageView.image = UIImage(data: data)
            }
        }
        task.resume()
    }
    
    func configureCell(message: Message) {
        self.message = message
        self.fromLabel.text = message.from
        self.messageBodyLabel.text = message.messageBody
        downloadImage(urlString: message.iconUrl, imageView: self.receivedIconImage)
        

    }


    
    /*
     from:
     "fabmeister"
     iconUrl:
     "https://firebasestorage.googleapis.com/v0/b/ico..."
     messageBody:
     "Would you want to go to the beach a 6th time?"
     to:
     "fabreeze23"

 
    
    
    private var _from: String!
    private var _iconUrl: String!
    
    private var _messageBody: String!
    
    private var _to: String!
    
    private var _postKey: String!
    
    
    var from: String {
        return _from
    }
    
    var iconUrl: String {
        return _iconUrl
    }
    
    var messageBody: String {
        return _messageBody
    }
    
    var to: String {
        return _to
    }
    
    
    init(title: String, videoURL: String) {
        //init initializes stored property types
        
        self._title = title
        self._videoURL = videoURL
        
    }

    */
    
}
