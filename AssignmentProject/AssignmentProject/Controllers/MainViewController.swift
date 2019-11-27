//
//  ViewController.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var tableViewDatsource: MainTableVeiwDataSource?
    var list: Welcome?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CustomTableViewTableViewCell", bundle: nil), forCellReuseIdentifier: CustomTableViewTableViewCell.identifier)
        NetworkRequest.getList(value: 0) { (Welcome) in
            self.list = Welcome
            DispatchQueue.main.async {
                self.self.tableViewDatsource = MainTableVeiwDataSource(tableView: self.tableView, list: self.list!)
                self.tableView.reloadData()
            }
        }
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigateToNextView(item: (list?.results[indexPath.row])!)
    }
    
    func navigateToNextView(item: Result) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detailView = storyBoard.instantiateViewController(identifier: "detailView") as? DetailViewController
        detailView?.details = item
        self.navigationController?.pushViewController(detailView!, animated: true)
        self.navigationController?.topViewController?.navigationItem.title = "DetailsViewController"
    }
}




