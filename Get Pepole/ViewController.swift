//
//  ViewController.swift
//  Get Pepole
//
//  Created by administrator on 17/10/2021.
//

import UIKit

class PeopleViewController: UITableViewController {
    
    
    // Hardcoded data for now
    var people : [NSDictionary] = []
    override func viewDidLoad() {
            super.viewDidLoad()
            StarWarsModel.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                data, response, error in
                    do {
                        // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let results = jsonResult["results"] as? NSArray {
                                for person in results {
                                    let personDict = person as! NSDictionary
                                    self.people.append(personDict)
                                }
                            }
                        }
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    } catch {
                        print("Something went wrong")
                    }
            })
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // if we return - sections we won't have any sections to put our rows in
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the count of people in our data array
        return people.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = people[indexPath.row]["name"] as? String
        // return the cell so that it can be rendered
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = people[indexPath.row]
        performSegue(withIdentifier: "mySegue", sender: person)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let person = sender as? NSDictionary
        let disController = segue.destination as? PeopledetailsViC
        disController?.personInfo = person 
    }
}

