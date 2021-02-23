//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Quan Le on 2021/16/2.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var tweetArray = [NSDictionary]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        refresher.addTarget(self, action: #selector(loadTweets), for: .valueChanged)
//        self.tweetArray.refreshControl = refresher
//        loadTweets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadTweets()
    }
    
    func loadTweets() {
       let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": 10]
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams, success: { (tweets: [NSDictionary]) in
            self.tweetArray.removeAll()
            for tweet in tweets {
                self.tweetArray.append(tweet)
            }
            
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("Failed to get tweets!")
        })
    }

    @IBAction func OnLogout(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetTableViewCell
        cell.tweetContentLabel.text = self.tweetArray[indexPath.row]["text"] as? String
        let user = self.tweetArray[indexPath.row]["user"] as! NSDictionary
        cell.userNameLabel.text = user["name"] as? String
        
        let imageUrl = URL(string: (user["profile_image_url_https"] as? String)!)
        let data = try? Data(contentsOf: imageUrl!)
        if let imageData = data {
            cell.profileImageView.image = UIImage(data: imageData)
        }
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.tweetArray.count
    }
}
