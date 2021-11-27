//
//  filmsDetailsVC.swift
//  StarWarsModel
//
//  Created by administrator on 19/10/2021.
//

import UIKit

class FilmsDetailsVC: UIViewController {
    var filmsInfo : NSDictionary!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var openingCrawLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Title: \( filmsInfo["title"] as? String ?? "")"
        openingCrawLabel.text = "Opening Crawl: \(filmsInfo["opening_crawl"] as? String ?? "")"
        releaseDateLabel.text = "Release Date: \( filmsInfo["release_date"] as? String ?? "")"
        directorLabel.text = "Director: \(filmsInfo["director"] as? String ?? "")"
        // Do any additional setup after loading the view.
    }

}
