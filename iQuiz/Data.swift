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

extension quizItem {
	init?(json: [String : Any]) {
		self.question = json["text"] as! String
		self.answer = json["answer"] as! String
		self.choices = json["answers"] as! [String]
	}
}

//class quizData {
//	var arr = [quizItem]()
//	var count = -1
//	var outOfQuestion : Bool = false
//	
//	func populate(id : Int) {
//		count = -1
//		outOfQuestion = false
//		for index : Int in 1...Int(arc4random_uniform(3)) {
//			var item = quizItem()
//			item.question = "Question \(index)"
//			item.choices = ["A", "B", "C", "D"]
//			item.answer = "A"
////			item.answer = item.choices[Int(arc4random_uniform(4))]
//			arr.append(item)
//		}
//	}
//	
//	func getQuestion() -> quizItem? {
//		count += 1
//		if count == arr.count - 1 {
//			outOfQuestion = true
//		}
//		return arr[count]
//	}
//}

struct quizCellData {
	var quizTitle : String = ""
	var quizDesc : String = ""
	var questionArr = [quizItem]()
}

extension quizCellData {
	init?(json: [String : Any]) {
		self.quizTitle = json["title"] as! String
		self.quizDesc = json["desc"] as! String
		let arr = json["questions"] as! [Any]
		for question in arr {
			let dict = question as! [String:Any]
			self.questionArr.append(quizItem.init(json: dict)!)
		}
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
	
	func toString() -> String {
		return "\(correct) out of \(total)"
	}
	
	func toScore() -> String {
		return "\(round(score * 10000.0) / 100.0)%"
	}
}
