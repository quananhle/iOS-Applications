//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Ashley Le on 2/15/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    var tweetArray = [NSDictionary]()
    var numberOfTweet: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadTweet(){
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": 10]
        
        TwitterAPICaller.client.getDictionariesRequest(url: myUrl, parameters: myParams,
                                                       success: { (tweets: [NSDictionary]) in self.tweetArray.removeAll()
                                                            for tweet in tweets {
                                                                tweetArray.append(tweet)
                                                            }
        }, failure: { (Error) in print("Could not retrieve tweets!")})
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as TweetCell
        cell.userNameLabel.text = "Some name"
        cell.tweetContent.text  = "Something else"
        return cell
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
