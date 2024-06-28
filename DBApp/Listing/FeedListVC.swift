//
//  FeedListVC.swift
//  DBApp
//
//  Created by Boariu Andy on 28.06.2024.
//

import UIKit

class FeedListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, FeedProtocol {

    @IBOutlet var tableView: UITableView!
    var viewModel: FeedListVM!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.fetchPosts()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.cellId, for: indexPath) as! FeedCell
        let feed = viewModel.arrFeeds[indexPath.row]
        cell.title.text = feed.title
        cell.body.text = feed.body
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.arrFeeds.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func receivedFeeds() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
