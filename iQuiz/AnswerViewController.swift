//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by William on 5/8/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
	
	var userChoice : String = ""
	var correctChoice : String = ""
	@IBOutlet weak var answer: UILabel!
	
	@IBAction func backToList(_ sender: UIBarButtonItem) {
		self.navigationController!.popToRootViewController(animated: true)
	}
	
	@IBAction func nextPressed(_ sender: UIButton) {
		
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.navigationItem.hidesBackButton = true
		answer.text = userChoice
//		self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
