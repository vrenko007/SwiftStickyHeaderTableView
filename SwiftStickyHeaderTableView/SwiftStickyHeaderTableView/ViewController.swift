//
//  ViewController.swift
//  SwiftStickyHeaderTableView
//
//  Created by Jacky Tay on 25/05/18.
//  Copyright © 2018 JackyTay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var sections = [Section]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    // MARK: - UITableVewiDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].rows[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: item.cellIdentifier, for: indexPath)
        if let vehicleCell = cell as? VehicleTableViewCell, let data = item as? VehicleRow {
            vehicleCell.bind(data: data)
        }
        else if let standardCell = cell as? StandardTableViewCell, let data = item as? StandardRow {
            standardCell.bind(data: data)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].header
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footer
    }
}

