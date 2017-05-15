//
//  ViewController.swift
//  iQuiz
//
//  Created by William on 4/28/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var sourceUpdated : Bool = true
	var quizCellCollection = [quizCellData]()
	var quizSourceURL : String = "https://tednewardsandbox.site44.com/questions.json"
//	var rowNum = -1;
	
	// cell reuse id (cells that scroll out of view can be reused)
	let cellReuseIdentifier = "Quiz"
	
	// don't forget to hook this up from the storyboard
	@IBOutlet var tableView: UITableView!
	
	@IBAction func SettingPressed(_ sender: UIBarButtonItem) {
		presentAlert()
	}
	
	func presentAlert() {
		let alertController = UIAlertController(title: "Settings", message: "Please enter custom quiz source", preferredStyle: .alert)
		
		let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (_) in
			if let field = alertController.textFields?[0] {
				// store your data
				self.quizSourceURL = field.text!
				self.downloadAndUpdate()
				self.tableView.reloadData()
				self.sourceUpdated = true
			}
		}
		
		let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
		
		alertController.addTextField { (textField) in
			textField.placeholder = "https://xxx.com/xxx.json"
		}
		
		alertController.addAction(confirmAction)
		alertController.addAction(cancelAction)
		
		self.present(alertController, animated: true, completion: nil)
	}
	
	// number of rows in table view
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.quizCellCollection.count
	}
	
	// create a cell for each table view row
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// create a new cell if needed or reuse an old one
		let cell:QuizCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! QuizCell
		
		// set the text from the data model
		cell.title.text = self.quizCellCollection[indexPath.row].quizTitle
		cell.subTitle.text = self.quizCellCollection[indexPath.row].quizDesc
		cell.quizCover.image = #imageLiteral(resourceName: "setting_icon")
		
		return cell
	}
	
	// method to run when table view cell is tapped
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		rowNum = indexPath.row
//	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "listToQuestion" {
			let dest = segue.destination as! QuestionViewController
			dest.questionArray = quizCellCollection[self.tableView.indexPath(for: sender as! UITableViewCell)!.row].questionArr
			
//			dest.quizIndex = self.tableView.indexPath(for: sender as! UITableViewCell)!.row
//			allQuestion.populate(id: self.tableView.indexPath(for: sender as! UITableViewCell)!.row)
//			dest.questionVault = allQuestion
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		downloadAndUpdate()
	}
	
	func downloadAndUpdate() {
		let documentsURL = try! FileManager().url(for: .documentDirectory,
		                                          in: .userDomainMask,
		                                          appropriateFor: nil,
		                                          create: true)
		let fileURL = documentsURL.appendingPathComponent("questions.json")
		if !FileManager().fileExists(atPath: fileURL.path) || sourceUpdated {
			downloadJSON(from: quizSourceURL)
			sourceUpdated = false
		}
		let data = try! Data(contentsOf: fileURL)
		let JSONobject = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
		let questions = JSONobject as? [Any]
		quizCellCollection.removeAll(keepingCapacity: false)
		for question in questions! {
			quizCellCollection.append(quizCellData(json: question as! [String:Any])!)
		}
	}
	
	func downloadJSON(from source : String) {
		let requestURL: URL = URL(string: source)!
		let sessionConfig = URLSessionConfiguration.default
		let session = URLSession(configuration: sessionConfig)
		let request = URLRequest(url: requestURL)
		
		let task = session.downloadTask(with: request) { (location, response, error) in
			if let location = location, error == nil {
				let locationPath = location.path
				let documents:String = NSHomeDirectory() + "/Documents/questions.json"
				let fileManager = FileManager.default
				do {
					try fileManager.moveItem(atPath: locationPath, toPath: documents)
				} catch {
					try! fileManager.removeItem(atPath: documents)
					try! fileManager.moveItem(atPath: locationPath, toPath: documents)
				}
				
			} else {
				print("Failure");
			}
		}
		task.resume()
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

