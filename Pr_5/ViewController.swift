//
//  ViewController.swift
//  Pr_5
//
//  Created by R86 on 24/03/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    var arr : [WelcomeElement] = []
    var searchArr : [WelcomeElement] = []
    @IBOutlet weak var searchBar: UISearchBar!
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
                self.searchArr = self.arr
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let navigation = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigation, animated: true)
        navigation.populaiton = arr[indexPath.row].population.description
        navigation.name = arr[indexPath.row].name.common
        navigation.imageForflag = stringToImage(link: arr[indexPath.row].flags.png)!
        navigation.imageforMudra = stringToImage(link: arr[indexPath.row].coatOfArms.png!)!
        
    }
    
    func stringToImage(link:String) -> UIImage? {
        let url1 = URL(string:link)
        let data = try? Data(contentsOf: url1! as URL)
        return UIImage(data: data!)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
            arr = searchArr.filter({ i in
                return i.name.common.contains(searchBar.text!)
            })
                Tableview.reloadData()
    }
    
}

