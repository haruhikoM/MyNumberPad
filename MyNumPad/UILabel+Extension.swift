//
//  UILabel+Extensions.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/11/27.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

// http://stackoverflow.com/questions/20580736/how-to-increase-the-character-spacing-in-uilabel

extension UILabel {
	func addCharacters(withSpacing spacing: CGFloat, text: String) {
		let attributedString = NSMutableAttributedString(string: text)
		attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSMakeRange(0, text.characters.count-1))
		attributedText = attributedString
	}
	
	func fadeTransition(withText text: String, duration: CFTimeInterval) {
		fadeTransition(duration: duration)
		self.text = text
	}
}
