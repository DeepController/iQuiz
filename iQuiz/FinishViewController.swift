//
//  FinishViewController.swift
//  iQuiz
//
//  Created by William on 5/9/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import UIKit

class FinishViewController: UIViewController {
	@IBOutlet weak var conclusion: UILabel!
	@IBOutlet weak var score: UILabel!
	
	var myScore = scoreData()

	@IBAction func back(_ sender: UIButton) {
		self.navigationController!.popToRootViewController(animated: true)
	}
	
	@IBAction func backToQuiz(_ sender: UIBarButtonItem) {
		self.navigationController!.popToRootViewController(animated: true)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		score.text = "You got " + myScore.toString()
		if myScore.score > 0.8 {
			conclusion.text = "Awesome"
		} else {
			conclusion.text = "Meh..."
		}
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
