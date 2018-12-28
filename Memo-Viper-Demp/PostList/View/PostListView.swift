//
//  PostListView.swift
//  Memo-Viper-Demp
//
//  Created by Aashish Adhikari on 12/27/18.
//  Copyright © 2018 Aashish Adhikari. All rights reserved.
//

import UIKit
import PKHUD

class PostListView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.addSubview(self.refreshControl)
        }
    }
    
    var presenter: PostListPresenterProtocol?
    var postList:[PostModel] = [ ]
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handelRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = .red
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
}

extension PostListView: PostListViewProtocol{
    func showPosts(with posts: [PostModel]) {
        postList = posts
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func showError(message: String) {
        HUD.flash(.label(message), delay: 2.0)
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
}

extension PostListView{
    @objc private func handelRefresh(_ refreshControl: UIRefreshControl){
        presenter?.updatePostList()
    }
}

extension PostListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.set(forPost: postList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPostDetail(forPost: postList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
}
