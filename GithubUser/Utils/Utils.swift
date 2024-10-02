//
//  Utils.swift
//  GithubUser
//
//  Created by Dang Luan on 2024/08/09.
//

import Foundation
import UIKit

class Utils {
    
    static let shared = Utils()
    
    func utcToLocal(dateStr: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateStr) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "YYYY-MM-DD HH:mm:ss"
            
            return dateFormatter.string(from: date)
        }
        return nil
    }
    
    func addIconToString(sysIconName: String, color: UIColor = .black, text: String, imageOffsetY: CGFloat = -3.0, isPrefix: Bool = true) -> NSMutableAttributedString {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: sysIconName)?.withTintColor(color, renderingMode: .alwaysTemplate)
        imageAttachment.bounds = CGRect(x: 0, y: imageOffsetY, width: imageAttachment.image?.size.width ?? 0, height: imageAttachment.image?.size.height ?? 0)
        let attachmentString = NSAttributedString(attachment: imageAttachment)
        let attributedStringColor = [NSAttributedString.Key.foregroundColor : color];
        
        
        let textAfterIcon = NSAttributedString(string: text, attributes: attributedStringColor)
        let completeText = NSMutableAttributedString(string: "")
        if(isPrefix) {
            completeText.append(attachmentString)
        }
        completeText.append(textAfterIcon)
        if(!isPrefix) {
            completeText.append(attachmentString)
        }
        return completeText
    }
}
