//
//  Data.swift
//  iQuiz
//
//  Created by William on 5/9/17.
//  Copyright © 2017 Yang Wang. All rights reserved.
//

import Foundation

struct quizItem {
	var question : String = ""
	var choices : [String] = [String]()
	var answer : String = ""
}

class quizData {
	var arr = [quizItem]()
	var count = -1
	var outOfQuestion : Bool = false
	
	func populate(id : Int) {
		count = -1
		outOfQuestion = false
		for index : Int in 1...Int(arc4random_uniform(3)) {
			var item = quizItem()
			item.question = "Question \(index)"
			item.choices = ["A", "B", "C", "D"]
			item.answer = "A"
//			item.answer = item.choices[Int(arc4random_uniform(4))]
			arr.append(item)
		}
	}
	
	func getQuestion() -> quizItem? {
		count += 1
		if count == arr.count - 1 {
			outOfQuestion = true
		}
		return arr[count]
	}
}

class scoreData {
	fileprivate var total : Int = 0
	fileprivate var correct : Int = 0
	var score : Double { get { return Double(correct) / Double(total)}}
	
	func updateScore(correct flag : Bool) {
		total += 1
		if flag {
			correct += 1
		}
	}
}
