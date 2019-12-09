//
//  ContactViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    var users = [Info]() {
        didSet {
            tableView.reloadData()
        }
        
    }

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        users = UserInformation.getUserInfo()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let contactsDVC = segue.destination as? ContactsDVController, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Unable to access Detail View Controller")
        }
        
        let usersAtIndexPath = users[indexPath.row]
        contactsDVC.user = usersAtIndexPath
    }
    
    func loadImage(imageURL: String) -> UIImage {
      var image: UIImage
      guard let url = URL(string: imageURL) else {
        fatalError("bad url: \(imageURL)")
      }
      
      do {
        let imageData = try Data(contentsOf: url)
        image = UIImage(data: imageData)!
      } catch {
        fatalError("\(error)")
      }
      return image
    }
    

}
extension ContactViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) 
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.fullName(user: user)
        cell.detailTextLabel?.text = user.fullAddress(user: user)
        cell.imageView?.image = loadImage(imageURL: user.picture.thumbnail)
        return cell
    }
}
