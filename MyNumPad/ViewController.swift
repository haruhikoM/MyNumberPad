//
//  ViewController.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/11/03.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var cancelButton: MyButton!
	
	@IBOutlet weak var firstInputLabel:  UILabel!
	@IBOutlet weak var secondInputLabel: UILabel!
	@IBOutlet weak var thirdInputLabel:  UILabel!
	@IBOutlet weak var lastInputLabel:   UILabel!
	
	var secretLetters: String {
		get {
			guard let labels = displayLabels else { return "unmatched" }
			var letters = ""
			for label in labels {
				if let letter = label.text {
					letters.append(letter)
				}
			}
			return letters
		}
	}
	
	var displayLabels: [UILabel]?
	
	var inputCounter = 0 {
		didSet {
			if inputCounter == 0 {
				self.cancelButton.setTitle("Cancel", for: .normal)
			}
			else {
				self.cancelButton.setTitle("Delete", for: .normal)
			}
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		displayLabels = [
			firstInputLabel,
			secondInputLabel,
			thirdInputLabel,
			lastInputLabel
		]

		NotificationCenter.default.addObserver( self,
									   selector: #selector(ViewController.updateKeyInputLabel(sender:)),
										   name: .numberButtonPressed, object: nil)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}

extension ViewController {
	func updateKeyInputLabel(sender: Any) {
		guard let note = sender as? Notification else { return }
		guard let touchedText = note.object as? String else { return }
		
		switch touchedText {
		case "Cancel": showSimpleAlert(withTitle: "You pressed cancel", message: "There is nothing to cancel.")
		case "Delete":
			displayLabels?[inputCounter-1].fadeTransition(withText: "\u{20DD}",duration: 0.18)
			if inputCounter > 0 { inputCounter -= 1 }
		default:
			guard let length = displayLabels?.count  else { return }
			if inputCounter > length - 1 { return }
			
			displayLabels?[inputCounter].fadeTransition(withText: touchedText, duration: 0.18)
			if inputCounter < 4 { inputCounter += 1 }
		}
		if secretLetters == "9854" {
			performSegue(withIdentifier: "animationDemoSegue", sender: nil)
		}
	}
}

extension UIViewController {
	func showSimpleAlert(withTitle title: String, message: String) {
		let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		alertController.addAction(okAction)
		present(alertController, animated: true, completion: nil)
	}
}

