//
//  ViewController.swift
//  iQuiz
//
//  Created by William on 4/28/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

	@IBAction func SettingPressed(_ sender: UIBarButtonItem) {
		let alert = UIAlertController.init(title: "Settings", message: "Settings go here", preferredStyle: .alert)
		let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
		alert.addAction(action)
		self.present(alert, animated: true, completion: nil)
	}
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		// Do any additional setup after loading the view, typically from a nib.
//	}
//
//	override func didReceiveMemoryWarning() {
//		super.didReceiveMemoryWarning()
//		// Dispose of any resources that can be recreated.
//	}


}

