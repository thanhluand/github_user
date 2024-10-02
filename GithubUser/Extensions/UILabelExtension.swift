//
//  UILabelExtension.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation
import UIKit

extension UILabel {
    func estLines() -> Int {
        let content = self.text ?? ""
        let rect = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let labelSize = content.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font ?? .systemFont(ofSize: 17)], context: nil)   
        let numLines = Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
        return numLines
    }
}
