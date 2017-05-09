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
	static var dict = [String : quizItem]()
	
	static func populate() {
		for index in 1...arc4random_uniform(3) + 1 {
			var item = quizItem()
			item.question = "Question \(index)"
			item.answer = "Answer \(index)"
			item.choices = ["A", "B", "C", "D"]
			dict["\(index)"] = item
		}
	}
}
