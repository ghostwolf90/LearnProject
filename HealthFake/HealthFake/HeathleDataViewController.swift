//
//  HeathleDataViewController.swift
//  HealthFake
//
//  Created by Laibit on 2018/11/2.
//  Copyright © 2018 Laibit. All rights reserved.
//

import UIKit

class HeathleDataViewController: UIViewController {

    let iconIDs = ["Heart", "Body", "Health Records Icon"]
    let healths = ["心臟", "身體測量", "健康紀錄"]
    
    @IBOutlet weak var midView2: UIView!
    @IBOutlet weak var midView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension HeathleDataViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return healths.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! HealthItemTableViewCell
        cell.setData(imageID: iconIDs[indexPath.row], title: healths[indexPath.row])
        return cell
    }
    
    
    
}
