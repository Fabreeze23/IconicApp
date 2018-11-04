//
//  Message.swift
//  IconicApp
//
//  Created by Fabrice Mulumba on 11/4/18.
//  Copyright © 2018 Fabrice Mulumba. All rights reserved.
//

import Foundation


class Message {
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
    
    
    /*
    init(title: String, videoURL: String) {
        //init initializes stored property types
        
        self._title = title
        self._videoURL = videoURL
        
    }
    */
    //=========================Initialization For Firebase==========================================
    
    init(messageKey: String, messageData: Dictionary<String, AnyObject>) {
        
        if let from = messageData["from"] as? String{
            self._from = from //_displayName is now set to the value from FireBase and it already gets returned when "displayName" is used. Because of the code at the top.
        }
        
        if let to = messageData["to"] as? String{
            self._to = to //_displayName is now set to the value from FireBase and it already gets returned when "displayName" is used. Because of the code at the top.
        }
        
        if let messageBody = messageData["messageBody"] as? String{
            self._messageBody = messageBody
        }
        
        if let iconUrl = messageData["iconUrl"] as? String {
            self._iconUrl = iconUrl
        }
        
        
       // _postRef = DataService.ds.REF_VIDEOS.child(_postKey)
    }

}


