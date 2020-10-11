//
//  ViewController.swift
//  LocalNotification2
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 11/10/20.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
    }
    
}

class TableViewController: UITableViewController {
    
    let list = ["tap me",
                "tap me"
    ]
    
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let listType = list[indexPath.row]
        
        let alert = UIAlertController(title: "", message: "after 5 secon notification will apear", preferredStyle: .alert)
        
        let okAct = UIAlertAction(title: "OK", style: .default) { (action) in
            self.appDelegate?.scheduleNotification(notificationType: listType)
        }
        alert.addAction(okAct)
        present(alert, animated: true, completion: nil)
    }
}

