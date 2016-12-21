//
//  AnimationDemoViewController.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/12/20.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

class AnimationDemoViewController: UIViewController {

	@IBOutlet weak var baseStackView: UIStackView!
	var images = [UIImage]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		let ranges = [0x1F601...0x1F64F, 0x2702...0x27B0]
		
		let rangeArray = Array(ranges.joined())
		images = rangeArray
			.flatMap { UnicodeScalar($0) }
			.map { Character($0) }
			.flatMap { String($0).image() }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	var transformStates = [true, true, true, true]
	@IBAction func pushImage(_ sender: Any) {
		guard let button = sender as? UIButton else { return }
		let tag = button.tag
		let imageView = baseStackView.arrangedSubviews[tag]
		let title = imageView.isHidden ? "Hide Me?" : "Show Me!"
		UIView.animate(withDuration: 0.28) {
			imageView.isHidden = !imageView.isHidden
			button.setTitle(title, for: .normal)
		}
		
		if imageView.isHidden == false {
			let transform = transformStates[tag] ? CGAffineTransform(scaleX: -1, y: 1) : CGAffineTransform.identity
			imageView.transform = transform
			transformStates[tag] = !transformStates[tag]
		}
	}
}
