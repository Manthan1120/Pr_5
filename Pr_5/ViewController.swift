//
//  ViewController.swift
//  Pr_5
//
//  Created by R86 on 24/03/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var arr : [WelcomeElement] = []
    
    @IBOutlet weak var Tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      countryApi()
    }

    func countryApi() {
        
        let url = URL(string: "https://restcountries.com/v3.1/all")
        var ur = URLRequest(url: url!)
        ur.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: ur) { data, response, error in
            do {
                self.arr = try JSONDecoder().decode([WelcomeElement].self, from: data!)

                DispatchQueue.main.async {
                    self.Tableview.reloadData()
                }
//                print(self.arr)
                
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.lable1.text = arr[indexPath.row].name.common
        cell.lable2.text = arr[indexPath.row].name.official
        cell.lable3.text = arr[indexPath.row].population.description
        cell.lable4.text = arr[indexPath.row].capitalInfo.latlng?.description
        cell.imageview.image = stringToImage(link: arr[indexPath.row].flags.png)
        
        return cell
    }
    
    func stringToImage(link:String) -> UIImage? {
        let url1 = URL(string:link)
        let data = try? Data(contentsOf: url1! as URL)
        return UIImage(data: data!)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

