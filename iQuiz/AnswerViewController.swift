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
	var questionContent : String = ""
	@IBOutlet weak var answer: UILabel!
	@IBOutlet weak var result: UILabel!
	@IBOutlet weak var question: UILabel!
	
	@IBAction func backToList(_ sender: UIBarButtonItem) {
		self.navigationController!.popToRootViewController(animated: true)
	}
	
	@IBAction func nextPressed(_ sender: UIButton) {
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "answerToFinish" {
			let dest = segue.destination as! FinishViewController
			if result.text! == "You Nailed It!!!" {
				dest.myScore = 1.0
			} else {
				dest.myScore = 0.0
			}
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.navigationItem.hidesBackButton = true
//		correctChoice = (super.currQuestion?.answer)!
		correctChoice = "A"
//		questionContent = (super.currQuestion?.question)!
		if userChoice == correctChoice {
			result.text = "You Nailed It!!!"
//			scoreBundle.updateScore(correct: true)
		} else {
			result.text = "You Fool!!!"
//			scoreBundle.updateScore(correct: false)
		}
		answer.text = "The answer is \(correctChoice)"
		question.text = questionContent
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
