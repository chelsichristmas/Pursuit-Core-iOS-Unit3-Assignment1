//
//  ContactsDVController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ContactsDVController: UIViewController {

    var user: Info?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        
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
    
    func updateUI() {
        nameLabel.text = " \(user!.fullName(user: user!)) "
        imageView.image = loadImage(imageURL: user!.picture.large)
        birthdateLabel.text = "DOB: \(user!.dob)"
        phoneLabel.text = "Phone: \(user!.cell)"
        emailLabel.text = "Email: \(user!.email)"
        
    }
    

    

}
