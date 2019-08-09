//
//  PostsTableViewController.swift
//  Assignment1
//
//  Created by admin on 09/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    private var page = 1
   private let apiClient = ApiClient()
    private var posts = [Post]()
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()

        // Do any additional setup after loading the view.
      
        
    }
    
    private func reloadData (){
        apiClient.getPost(page: page, completionHandler: { (posts) in
            DispatchQueue.main.async {
                self.posts.append(contentsOf: posts)
                self.title = "\(self.posts.count)"
                self.tableView.reloadData()
            }
        }) {
            print("Error Found")
        }
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == posts.count-1{
            page += 1
            reloadData()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTablViewCell", for: indexPath) as! PostTablViewCell
        
        let post = posts[indexPath.row]
        cell.display(post: post)

        return cell
    }

}
