//
//  PeopledetailsViC.swift
//  StarWarsModel
//
//  Created by administrator on 19/10/2021.
//

import UIKit

class PeopledetailsViC: UIViewController {
    var personInfo: NSDictionary!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \( personInfo["name"] as? String ?? "")"
        massLabel.text = "Mass: \(personInfo["mass"] as? String ?? "")"
        birthYearLabel.text = "Birth Year: \( personInfo["birth_year"] as? String ?? "")"
        genderLabel.text = "Gender: \(personInfo["gender"] as? String ?? "")"
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        
    }
}
