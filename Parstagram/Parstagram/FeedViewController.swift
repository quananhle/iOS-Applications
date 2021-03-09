//
//  FeedViewController.swift
//  Parstagram
//
//  Created by Ashley Le on 3/1/21.
//  Copyright © 2021 codepath. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
import MessageInputBar

//class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    @IBOutlet weak var tableView: UITableView!
//    let commentBar = MessageInputBar()
//    var showCommentBar = false
//    var posts = [PFObject]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.keyboardDismissMode = .interactive
//    }
//
//    override var inputAccessoryView: UIView? {
//        return commentBar
//    }
//    override var canBecomeFirstResponder: Bool {
//        return showCommentBar
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let query = PFQuery(className:"Posts")
//        query.includeKey("author")
////        query.includeKeys(["author", "comments", "comments.author"])
//        query.limit = 20
//        query.findObjectsInBackground { (posts, error) in
//            if posts != nil {
//                self.posts = posts!
//                self.tableView.reloadData()
//            }
//            else {
//                print("Error loading posts")
//            }
//        }
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let post = posts[section]
//        let comments = post["comments"] as? [PFObject] ?? []
//        return comments.count + 2
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 500
//    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return posts.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let post = posts[indexPath.section]
//        let comments = (post["comments"] as? [PFObject]) ?? []
//        if indexPath.section == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
//            let user = post["author"] as! PFUser
//            cell.usernameLabel.text = user.username
//            cell.captionLabel.text = post["caption"] as? String
//            let imageFile = post["image"] as! PFFileObject
//            let urlString = imageFile.url!
//            let url = URL(string: urlString)!
//            cell.photoView.af_setImage(withURL: url)
//            return cell
//        }
//        else if indexPath.section <= comments.count {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
////            let comment = comments[indexPath.section - 1]
//            let comment = comments[indexPath.section]
//            cell.commentLabel.text = comment["text"] as? String
//            let user = comment["author"] as! PFUser
//            cell.nameLabel.text = user.username
//            return cell
//        }
//        else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
//            return cell
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let post = posts[indexPath.section]
//        let comment = PFObject(className: "Comments")
//        comment["texts"] = "One word: Doge"
//        comment["post"] = post
//        comment["author"] = PFUser.current()!
//
//        post.add(comment, forKey: "comments")
//        post.saveInBackground { (success, error) in
//            if success {
//                print ("Comment saved!")
//            }
//            else {
//                print ("Error saving comment")
//            }
//        }
//    }
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//    @IBAction func onLogoutButton(_ sender: Any) {
//        PFUser.logOut()
//        let main = UIStoryboard(name: "Main", bundle: nil)
//        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
//        let delegate = self.view.window?.windowScene?.delegate as! SceneDelegate
//        delegate.window?.rootViewController = loginViewController
//    }
//}
class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MessageInputBarDelegate {
    
    var posts = [PFObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let comments = (posts[section]["comments"] as? [PFObject]) ?? []
        return comments.count + 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.section]
        let comments = (post["comments"] as? [PFObject]) ?? []
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
            let user = post["author"] as! PFUser
            cell.usernameLabel.text = user.username
            cell.captionLabel.text = post["caption"] as! String
            let imageFile = post["image"] as! PFFileObject
            let url = URL(string: imageFile.url!)
            cell.photoView.af_setImage(withURL: url!)
            return cell
        } else if indexPath.row <= comments.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell") as! CommentCell
            let comment = comments[indexPath.row - 1]
            cell.commentLabel.text = comment["text"] as? String
            cell.nameLabel.text = (comment["author"] as! PFUser).username
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCommentCell")!
            return cell
        }
    }

    
    var currentPost: PFObject!
    @IBOutlet weak var tableView: UITableView!
    let commentBar = MessageInputBar()
    var showsCommentBar = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.keyboardDismissMode = .interactive
        commentBar.inputTextView.placeholder = "Add a comment..."
        commentBar.sendButton.title = "Post"
        commentBar.delegate = self
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//        DataRequest.addAcceptableImageContentTypes(["application/octet-stream"])
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillBeHidden(note: Notification) {
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
    }
    
    override var inputAccessoryView: UIView? {
        return commentBar
    }
    
    override var canBecomeFirstResponder: Bool {
        return showsCommentBar
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Posts")
        query.includeKeys(["author", "comments", "comments.author"])
        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            } else {
                print(error)
            }
        }
    }
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        let comment = PFObject(className: "Comment")
        
        comment["text"] = text
        comment["post"] = currentPost
        comment["author"] = PFUser.current()

        currentPost.add(comment, forKey: "comments")

        currentPost.saveInBackground { (succ, err) in
            if (succ) {
                print("comment saved")
            } else {
                print("error posting comment")
            }
        }
        
        commentBar.inputTextView.text = nil
        showsCommentBar = false
        becomeFirstResponder()
        commentBar.inputTextView.resignFirstResponder()
        tableView.reloadData()
    }
    
    @IBAction func onLogOut(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let login = main.instantiateViewController(withIdentifier: "LoginViewController")
        let delegate = self.view.window?.rootViewController = login
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.section]
        currentPost = post
        let comment = PFObject(className: "Comment")
        
        if indexPath.row == (post["comments"] as? [PFObject] ?? []).count+1 {
            showsCommentBar = true
            self.becomeFirstResponder()
            commentBar.inputTextView.becomeFirstResponder()
        }
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
