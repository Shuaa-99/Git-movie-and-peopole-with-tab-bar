//
//  FilmTableViewController.swift
//  Get Pepole
//
//  Created by administrator on 17/10/2021.
//

import UIKit

class FilmTableViewController: UITableViewController {
    var films : [NSDictionary] = []
    override func viewDidLoad() {
            super.viewDidLoad()
        StarWarsModel.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
                    do {
                        if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                            if let results = jsonResult["results"] as? NSArray {
                                for filmm in results {
                                    let filmDict = filmm as! NSDictionary
                                    self.films.append(filmDict)
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
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a generic cell
        let cell = UITableViewCell()
        // set the default cell label to the corresponding element in the people array
        cell.textLabel?.text = films[indexPath.row]["title"] as? String
        // return the cell so that it can be rendered
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = films[indexPath.row]
        performSegue(withIdentifier: "mySegue", sender: film)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let film = sender as? NSDictionary
        let disController = segue.destination as? FilmsDetailsVC
        disController?.filmsInfo = film
    }
}

