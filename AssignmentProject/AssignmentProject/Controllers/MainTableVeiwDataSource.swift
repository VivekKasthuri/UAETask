//
//  MainTableVeiwDataSource.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit

class MainTableVeiwDataSource: NSObject {
    
    var result: Welcome?
    init(tableView: UITableView,list: Welcome) {
        super.init()
        tableView.dataSource = self
        result = list
    }

}

extension MainTableVeiwDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (result?.results.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewTableViewCell.identifier) as! CustomTableViewTableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.authorLable?.text = result?.results[indexPath.row].byline
        cell.titleLable?.text = result?.results[indexPath.row].title
        cell.dateLable?.text = result?.results[indexPath.row].publishedDate
        cell.profileView.imageFromServerURL(url: (result?.results[indexPath.row].media[0].mediaMetadata[0].url)!)
        return cell
    }
}

