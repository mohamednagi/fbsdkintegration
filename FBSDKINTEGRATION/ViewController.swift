//
//  ViewController.swift
//  FBSDKINTEGRATION
//
//  Created by Sierra on 9/15/18.
//  Copyright © 2018 Nagiz. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController , FBSDKLoginButtonDelegate {
    
    let loginButton : FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email"]
        return button
    }()
    
  //  let loginButton : FBSDKLoginButton = FBSDKLoginButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate=self
        
     //   loginButton.readPermissions = ["email"]
        if let token = FBSDKAccessToken.current(){
            fetchProfile()
        }
    }


    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("fetch Profile")
        fetchProfile()
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        
        return true
    }
    
    func fetchProfile(){
        print("fetch profile")
        
        let parameters = ["fields" : "id, first_name, last_name, email , friends"]
        
        let graphRequest = FBSDKGraphRequest(graphPath: "/1022406211274730", parameters: parameters, httpMethod: "GET")
        let connection = FBSDKGraphRequestConnection()
        connection.add(graphRequest) { (connection, result, error) in
            if error == nil{
                if let userData = result {
                print(userData)
            }else{
                print(error!)
            }
            }
        }
        connection.start()
//
//        FBSDKGraphRequest(graphPath: "/me/friends", parameters: parameters).start { (connection, result, error) in
//            if error != nil{
//                print(error?.localizedDescription)
//                return
//            }
//            print(result!)
//        }
        
        
    }
}

