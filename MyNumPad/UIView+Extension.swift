//
//  UIView+Extension.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/12/01.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

extension UIView {
	func findNumberLabel(completion: (Int)->Void) {
		for subview in subviews {
			if let label = subview as? UILabel, let labelText = label.text, let num = Int(labelText) {
				completion(num)
				break
			}
			else {
				subview.findNumberLabel(completion: completion)
			}
			
		}
	}
	
	func findKeypadLabel(completion: (UILabel)->Void) {
		for subview in subviews {
			if let label = subview as? UILabel, let labelText = label.text, labelText == "Label" {
				completion(label)
				break
			}
			else {
				subview.findKeypadLabel(completion: completion)
			}
		}
	}
}

//:MARK - or, more ptotocol oriented way...

protocol SubviewSearchable {
	associatedtype FoundType
	func findLabel(withCondition condition: ()->Bool, completion: (FoundType)->Void)
}

enum FoundLabelType {
	case number(Int)
	case key(UILabel)
}

extension UIView: SubviewSearchable {
	typealias FoundType = FoundLabelType

	func findLabel(withCondition condition: ()->Bool, completion: (FoundType)->Void) {
		for subview in subviews {
			if let label = subview as? UILabel, let labelText = label.text {
				if labelText == "Label" {
					completion(FoundLabelType.key(label))
					break
				}
				else if let number = Int(labelText) {
					completion(FoundType.number(number))
					break
				}
			}
			subview.findLabel(withCondition: condition, completion: completion)
		}
	}
}

extension UIView {
	/*
	// Fade-in-out animation
	// http://stackoverflow.com/questions/3073520/animate-text-change-in-uilabel
	*/
	func fadeTransition(duration: CFTimeInterval) {
		let animation = CATransition()
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
		animation.type = kCATransitionFade
		animation.duration = duration
		self.layer.add(animation, forKey: kCATransitionFade)
	}
}

