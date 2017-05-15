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
	var questionArray = [quizItem]()
	var score = scoreData()
	@IBOutlet weak var answer: UILabel!
	@IBOutlet weak var result: UILabel!
	@IBOutlet weak var question: UILabel!
	
	@IBAction func backToList(_ sender: UIBarButtonItem) {
		self.navigationController!.popToRootViewController(animated: true)
	}
	
	@IBAction func nextPressed(_ sender: UIButton) {
		questionArray = Array(questionArray.dropFirst(1))
		if questionArray.count == 0 {
			performSegue(withIdentifier: "answerToFinished", sender: nil)
		} else {
			performSegue(withIdentifier: "answerToNextQuestion", sender: nil)
		}
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if segue.identifier == "answerToFinished" {
			let dest = segue.destination as! FinishViewController
			dest.myScore = score
		} else {
			let dest = segue.destination as! QuestionViewController
			dest.score = score
			dest.questionArray = questionArray
		}
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		self.navigationItem.hidesBackButton = true
		let currentQuestion = questionArray[0]
		if userChoice == currentQuestion.answer {
			result.text = "You Nailed It!!!"
			score.updateScore(correct: true)
		} else {
			result.text = "You Fool!!!"
			score.updateScore(correct: false)
		}
		answer.text = "The answer is \n\(currentQuestion.choices[Int(currentQuestion.answer)! - 1])"
		question.text = currentQuestion.question
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
