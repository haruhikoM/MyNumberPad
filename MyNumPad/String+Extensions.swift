//
//  String+Extensions.swift
//  MyNumPad
//
//  Created by Minamiguchi Haruhiko on 2016/12/20.
//  Copyright © 2016 Minamiguchi Haruhiko. All rights reserved.
//

import UIKit

extension String {
	func image() -> UIImage? {
		let size = CGSize(width: 100, height: 100)
		UIGraphicsBeginImageContextWithOptions(size, false, 0);
		UIColor.lightGray.set()
		let rect = CGRect(origin: CGPoint(), size: size)
		UIRectFill(CGRect(origin: CGPoint(), size: size))
		(self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 80)])
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
}
