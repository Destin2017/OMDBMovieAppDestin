//
//  BookmarkDetailsViewController.swift
//  OMDBMovieApp
//
//  Created by ilabafrica on 01/04/2017.
//  Copyright © 2017 VODACOM. All rights reserved.
//
import UIKit
import Alamofire
import CoreData
import AVKit
import AVFoundation
import FBSDKShareKit
import FBSDKLoginKit
class BookmarkDetailsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
     var selectedMovie = Dictionary<String,String>()
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    let imagePicker = UIImagePickerController()
    
    
           let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
          
                imagePoster.contentMode = .scaleAspectFit
              //  downloadImage(url: checkedUrl)
                titleLabel.text = selectedMovie["title"]
                
            
            
        }
        
        func downloadImage(url: URL) {
            print("Download Started")
            getDataFromUrl(url: url) { (data, response, error)  in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() { () -> Void in
                    self.imagePoster.image = UIImage(data: data)
                   }
                }
        }
        
        func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
            URLSession.shared.dataTask(with: url) {
                (data, response, error) in
                completion(data, response, error)
                }.resume()
        }
        @IBAction func logOutPress(_ sender: UIButton) {
            let loginManager = FBSDKLoginManager()
            loginManager.logOut() // this is an instance function
        }
        
    
            
            
        }
        
    
    
        
        
        
        

