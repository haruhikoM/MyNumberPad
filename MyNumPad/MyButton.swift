//
//  MyButton.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/11/03.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

@IBDesignable

class MyButton: UIButton {
	override func awakeFromNib() {
		super.awakeFromNib()
		addTarget(self, action: #selector(MyButton.mePressed(sender:)),   for: .touchDown)
		addTarget(self, action: #selector(MyButton.mePressedUp(sender:)), for: .touchUpInside)
	}
	
    override func draw(_ rect: CGRect) {
		if let title = titleLabel?.text, Int(title) != nil {
			layer.borderWidth = 1.0
			layer.borderColor = UIColor.black.cgColor
			layer.cornerRadius = frame.height / 2
			clipsToBounds = true
		}
    }
	
	func mePressedUp(sender: Any) {
		guard let button = sender as? MyButton else { return }
		
		button.layer.removeAllAnimations()
		UIView.animate(withDuration: 0.2,
		               delay: 0,
		               options: .curveEaseIn,
		               animations: { button.layer.backgroundColor = UIColor.clear.cgColor },
		               completion: nil )
		
		let buttonText = button.titleLabel?.text ?? ":("
		NotificationCenter.default.post(name: .numberButtonPressed, object: buttonText)
	}
	
	func mePressed(sender: Any) {
		guard let button = sender as? UIButton else { return }
		button.layer.removeAllAnimations()
		if let title = button.titleLabel?.text, Int(title) != nil {
			UIView.animate(withDuration: 0.1,
			               animations: { button.layer.backgroundColor = UIColor.black.cgColor } )
		}
	}
	
}

enum ButtonText: String {
	case cancel
	case delete
}
