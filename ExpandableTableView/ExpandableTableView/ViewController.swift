//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by Laibit on 2018/10/19.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

struct CellData {
    var isOpen:Bool
    var sectionTitle:String
    var sectionData:[String]
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTableView: UITableView!
    var tableViewData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewData = [CellData(isOpen: false, sectionTitle: "Animals", sectionData: ["Cat", "Dag", "haha"]), CellData(isOpen: false, sectionTitle: "Colors", sectionData: ["Red", "Blue", "Green"]), CellData(isOpen: false, sectionTitle: "Fruits", sectionData: ["Apple", "Banana", "Mango"]), CellData(isOpen: false, sectionTitle: "Numbers", sectionData: ["1", "2", "3", "4"])]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpen{
            return tableViewData[section].sectionData.count + 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionTitle
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].isOpen{
                tableViewData[indexPath.section].isOpen = false
                let indexes = IndexSet(integer: indexPath.section)
                tableView.reloadSections(indexes, with: .automatic)
            }else{
                tableViewData[indexPath.section].isOpen = true
                let indexes = IndexSet(integer: indexPath.section)
                tableView.reloadSections(indexes, with: .automatic)
            }
        }else{
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    
}

