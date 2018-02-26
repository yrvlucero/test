//
//  ViewController.swift
//  test
//
//  Created by Yngwie Reigh Vincent Lucero on 23/2/18.
//

import UIKit
import SDWebImage

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    var tableView = UITableView()
    var object: ModelObject?
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.contentInset.top = 30
        tableView.estimatedRowHeight = 300
        tableView.rowHeight = UITableViewAutomaticDimension
        
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "my")
        Api().getData().success { (object) in
            self.object = object
            self.setNavBarToTheView(title: object.title)
            self.tableView.reloadData()
            }.failure { (err) in
                print("ERROR", err.localizedDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setNavBarToTheView(title: String) {
        let navBar: UINavigationBar = UINavigationBar()
        self.view.addSubview(navBar)
        navBar.translatesAutoresizingMaskIntoConstraints = false
        navBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        navBar.heightAnchor.constraint(equalToConstant: 50)
        navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        let navItem = UINavigationItem(title: title)
        navBar.setItems([navItem], animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return object?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath) as! CustomTableViewCell
        let row = object?.rows[indexPath.row]
        cell.awakeFromNib()
        cell.titleText.text = row?.title ?? ""
        cell.descriptionText.text = row?.description
        if let url = URL(string: row?.imageHref ?? "") {
            cell.pictureView.sd_setImage(with: url, completed: nil)
        }
        return cell
    }
    
    @objc func refreshData() {
        Api().getData().success { (object) in
            self.object = object
            self.setNavBarToTheView(title: object.title)
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            }.failure { (err) in
                print("ERROR", err.localizedDescription)
        }
    }
}

