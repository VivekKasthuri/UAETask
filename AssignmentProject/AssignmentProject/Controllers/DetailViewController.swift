//
//  DetailViewController.swift
//  AssignmentProject
//
//  Created by Vivekvardhan Kasthuri on 27/11/19.
//  Copyright © 2019 Vivekvardhan Kasthuri. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var profilePic: AsyncImageView!
    @IBOutlet var titleLable: UILabel!
    @IBOutlet var authorLable: UILabel!
    @IBOutlet var dateLable: UILabel!
    var details: Result?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        profilePic.imageFromServerURL(url: (details?.media[0].mediaMetadata[0].url)!)
        titleLable.text = details?.title
        authorLable.text = details?.byline
        dateLable.text = details?.publishedDate
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
