//
//  MovieDetailsViewController.swift
//  OMDBMovieApp
//
//  Created by Karumba Samuel on 20/02/2017.
//  Copyright © 2017 IBM. All rights reserved.
//

import UIKit
import Alamofire

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgPoster: UIImageView!
    
    var movie: SearchViewController.MyMovieModel? {
        
        didSet{
            title = movie?.title

            loadMovieDetails(imdbID: (movie?.imdbID)!)
            
            
        }
    }
    
    var movieInfo: MyMovieDetailsModel? {
        didSet{
            
            let posterURL = NSURL(string:(movie?.poster)!)
            
            if let imageData = NSData(contentsOf: posterURL as! URL) {
                self.imgPoster?.image = UIImage(data: imageData as Data)
            }
        }
    }
    
    

    struct MyMovieDetailsModel {
        var poster = ""
        var title = ""
        var type = ""
        var year = ""
        var imdbID = ""
        var Released = ""
        var Genre = ""
        var Director = ""
        var Writer = ""
        var Actors = ""
        var Plot = ""
        var Language = ""
        var Metascore = ""
        var imdbRating = ""
        var imdbVotes = ""

        init(_ objMovie: NSDictionary){
            self.poster = (objMovie ["Poster"] as? String)!
            self.title = (objMovie ["Title"] as? String)!
            self.type = (objMovie ["Type"] as? String)!
            self.year = (objMovie ["Year"] as? String)!
            self.imdbID = (objMovie ["imdbID"] as? String)!
            
            self.Released = (objMovie ["Released"] as? String)!
            self.Genre = (objMovie ["Genre"] as? String)!
            self.Director = (objMovie ["Director"] as? String)!
            self.Writer = (objMovie ["Writer"] as? String)!
            self.Actors = (objMovie ["Actors"] as? String)!
            self.Language = (objMovie ["Language"] as? String)!
            self.Plot = (objMovie ["Plot"] as? String)!
            self.Metascore = (objMovie ["Metascore"] as? String)!
            self.imdbRating = (objMovie ["imdbRating"] as? String)!
            self.imdbVotes = (objMovie ["imdbVotes"] as? String)!
            
            
            
        }
        
    }
    

    func loadMovieDetails(imdbID: String) {
        
//        let imdID = movie?.imdbID
        
        Alamofire.request("http://www.omdbapi.com/?i=\(imdbID)").responseJSON { response in
            
            if let JSON = response.result.value {
                
                if let movie = JSON as? NSDictionary {
                    //pass it to a structure and add it to my movie list
                    self.movieInfo =  MyMovieDetailsModel(movie)
                    
                }
                
                
                
                print("JSON: \(JSON)")
                
                
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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