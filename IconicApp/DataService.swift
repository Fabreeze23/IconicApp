//
//  DataService.swift
//  IconicApp
//
//  Created by Fabrice Mulumba on 11/4/18.
//  Copyright © 2018 Fabrice Mulumba. All rights reserved.
//

import Foundation
import Firebase
import SwiftKeychainWrapper

let DB_BASE = Database.database().reference() //Refers to Firebase database
let STORAGE_BASE = Storage.storage().reference() //Refers to Firebase storage (Images, and videos)

let userInfo = Auth.auth().currentUser?.providerData[0] //Data of current user from authentication provider

let currentUser = Auth.auth().currentUser

class DataService {
    static let ds = DataService()
    
    ///Database references
    private var _REF_BASE = DB_BASE
    private var _REF_RECEIVED_MESSAGES = DB_BASE.child("user-received").child((currentUser?.displayName)!)
    private var _REF_USER = DB_BASE.child("users").child((currentUser?.uid)!)
    private var _REF_ICONS = DB_BASE.child("icons").child((currentUser?.uid)!)
    
    
    //Storage references
    
    private var _REF_PROFILE_PICS = STORAGE_BASE.child("profile-pics/")
    private var _REF_POST_VIDEOS = STORAGE_BASE.child("videos/")
    
    var REF_BASE: DatabaseReference {
        return _REF_BASE
    }
    
    var REF_RECEIVED_MESSAGES: DatabaseReference {
        return _REF_RECEIVED_MESSAGES
    }
    
    
    var REF_USER: DatabaseReference {
        return _REF_USER
    }
    
    var REF_ICONS: DatabaseReference {
        return _REF_ICONS
    }
    
    
    //Identifies the user to be updated by the uid
    

    
}
