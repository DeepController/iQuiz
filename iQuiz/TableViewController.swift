//
//  ViewController.swift
//  iQuiz
//
//  Created by William on 4/28/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let titleData = ["Mathematics", "Marvel Super Heroes", "Science"]
	let subTitleData = ["Mathematics", "Marvel Super Heroes", "Science"]
	
	// cell reuse id (cells that scroll out of view can be reused)
	let cellReuseIdentifier = "QuizItem"
	
	// don't forget to hook this up from the storyboard
	@IBOutlet var tableView: UITableView!
	
	@IBAction func SettingPressed(_ sender: UIBarButtonItem) {
		let alert = UIAlertController.init(title: "Settings", message: "Settings go here", preferredStyle: .alert)
		let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		self.present(alert, animated: true, completion: nil)
	}
	
	// number of rows in table view
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.titleData.count
	}
	
	// create a cell for each table view row
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// create a new cell if needed or reuse an old one
		let cell:QuizCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! QuizCell
		
		// set the text from the data model
		cell.title.text = self.titleData[indexPath.row]
		cell.subTitle.text = self.subTitleData[indexPath.row]
		cell.quizCover.image = #imageLiteral(resourceName: "setting_icon")
		
		return cell
	}
	
	// method to run when table view cell is tapped
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("You tapped cell number \(indexPath.row).")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Register the table view cell class and its reuse id
//		self.tableView.register(QuizCell.self, forCellReuseIdentifier: cellReuseIdentifier)
		
		// This view controller itself will provide the delegate methods and row data for the table view.
		tableView.delegate = self
		tableView.dataSource = self
	}

}

