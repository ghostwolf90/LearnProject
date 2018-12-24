//
//  TalksViewController.swift
//  line
//
//  Created by Laibit on 2018/11/30.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension ChatsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "demo"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let chatViewController = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
        navigationController?.pushViewController(chatViewController, animated: true)
        
        
    }
    
    
}
