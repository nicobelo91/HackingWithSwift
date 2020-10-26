//
//  ViewController.swift
//  Project 1
//
//  Created by user183145 on 10/19/20.
//  Copyright © 2020 Nico Cobelo. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                //this is a picture to load!
                pictures.append(item)
            }
            pictures.sort()
        }
        
        print(pictures)
    }
    //                      how many rows there are in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    //               tableview is making the request    specifies the row number
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //the returned UITableViewCell value is "Picture"
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        //gives the text label the same name as the picture in the array
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //                      if it asked for "Detaildddd" it fails because it doesn't exist
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController { //typcasted as DetailViewController. Otherwise, we get a regular ViewController
        // if the code above fails, the following two lines won't execute
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
