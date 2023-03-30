//
//  ViewController2.swift
//  Pr_5
//
//  Created by R86 on 29/03/23.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var imageForMudra: UIImageView!
    @IBOutlet weak var lableForPopulation: UILabel!
    @IBOutlet weak var imageForFlage: UIImageView!
    @IBOutlet weak var lableForContryName: UILabel!
    var name = ""
    var populaiton = ""
    var imageForflag = UIImage()
    var imageforMudra = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        lableForContryName.text = name
        lableForPopulation.text = populaiton
        imageForFlage.image = imageForflag
        imageForMudra.image = imageforMudra
        // Do any additional setup after loading the view.
    }
    

    

}
