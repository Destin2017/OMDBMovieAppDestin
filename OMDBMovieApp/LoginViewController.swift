//
//  LoginViewController.swift
//  OMDBMovieApp
//
//  Created by Karumba Samuel on 24/02/2017.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKLoginKit

class LoginViewController: UIViewController {

    @IBOutlet weak var btnFacebookLogin: LoginButton!
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var imgUserProfilePic: UIImageView!
    
    @IBAction func loginButtonClicked(_ sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let loginButton = LoginButton(readPermissions: [.publicProfile])
//        loginButton.center = view.center
//        
//        view.addSubview(loginButton)
    }
    
    func configButton() {
        btnFacebookLogin = LoginButton(readPermissions: [.publicProfile, .email,.userFriends])
        
        
        btnFacebookLogin.delegate = self
    }
    
    // Once the button is clicked, show the login dialog
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let _, let accessToken):
                print("Logged in!")
            }
        }
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
