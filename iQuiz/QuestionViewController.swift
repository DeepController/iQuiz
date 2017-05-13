//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by William on 5/8/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

	@IBOutlet weak var content: UILabel!
	@IBOutlet weak var choiceA: UIButton!
	@IBOutlet weak var choiceB: UIButton!
	@IBOutlet weak var choiceC: UIButton!
	@IBOutlet weak var choiceD: UIButton!
	@IBOutlet weak var submit: UIButton!
	
	var quizIndex = -1;
	var questionArray = [quizItem]()
	var score = scoreData()
	var selected : String = "";
	let GREEN = UIColor(red:0.451, green:0.980, blue:0.475, alpha:1.000)
	let BLUE = UIColor(red:0.000, green:0.478, blue:1.000, alpha:1.000)
	
	
	
	@IBAction func choicePressed(_ sender: UIButton) {
		let choices = [choiceA, choiceB, choiceC, choiceD]
		for choice in choices {
			choice?.setTitleColor(BLUE, for: .normal)
		}
		sender.setTitleColor(GREEN, for: .normal)
		submit.setTitleColor(BLUE, for: .normal)
		submit.backgroundColor = GREEN
		selected = sender.currentTitle!
	}
	
	
	override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
		return selected != ""
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "questionToAnswer" {
			let dest = segue.destination as! AnswerViewController
			dest.userChoice = selected
			dest.questionContent = content.text!
//			dest.correctChoice = "A"
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
//		super.currQuestion = super.questionVault?.getQuestion()
//		content.text = (currQuestion?.question)! + "\n(key is A)"
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
