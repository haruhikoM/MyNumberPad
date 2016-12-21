//
//  ButtonBaseView.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/12/01.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

class ButtonBaseView: UIView {
	static let keypadStrings = ButtonBaseView.createKeypadStrings()
	
	func setKeyString(withNumber number: Int) {
		let text = ButtonBaseView.keypadStrings[number] ?? "TEST"
		findKeypadLabel { label in
			label.addCharacters(withSpacing: 3.0, text: text)
		}
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		setup()
	}
	
	func setup() {
		findNumberLabel { num in
			setKeyString(withNumber: num)
		}
	}

	private static func createKeypadStrings() -> [Int: String] {
		print("🙄")
		var alphabet = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
		var buttonNum: Int = 1
		var buttonPair = [Int: String]()
		
		while buttonNum < 10 {
			var buttonAlphabetKeys: String = ""
			switch buttonNum {
			case 1: buttonAlphabetKeys = "   "
			case 2...6, 8:
				for _ in 1...3 { buttonAlphabetKeys.append(alphabet.removeFirst()) }
			case 7, 9:
				for _ in 1...4 { buttonAlphabetKeys.append(alphabet.removeFirst()) 	}
			default:
				print("")
			}
			buttonPair[buttonNum] = buttonAlphabetKeys.uppercased()
			buttonNum += 1
		}
		return buttonPair
	}
}
