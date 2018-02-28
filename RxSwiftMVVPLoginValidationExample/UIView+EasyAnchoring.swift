//
//  EasyAnchoring.swift
//  CellRegistrationWithPOP&Extensions
//
//  Created by David on 25/02/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

extension UIView {
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return layoutMarginsGuide.leadingAnchor
        }
    }
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return layoutMarginsGuide.topAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return layoutMarginsGuide.bottomAnchor
        }
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return layoutMarginsGuide.trailingAnchor
        }
    }
    
    public func centerXtoSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: constant).isActive = true
        }
    }
    
    public func centerYtoSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor, constant: constant).isActive = true
        }
    }
    
    public func anchorCenterSuperview() {
        centerXtoSuperview()
        centerYtoSuperview()
    }
    
    public func anchorDimensions(width: CGFloat = 0, height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top: nil, leading: nil, bottom: nil, trailing: nil, topConstant: 0, leadingConstant: 0, bottomConstant: 0, trailingConstant: 0, width: width, height: height)
    }
    
    public func anchorSize(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    
    public func anchor(_ top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leadingConstant: CGFloat = 0, bottomConstant: CGFloat = 0, trailingConstant: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        _ = anchorWithReturnAnchors(top: top, leading: leading, bottom: bottom, trailing: trailing, topConstant: topConstant, leadingConstant: leadingConstant, bottomConstant: bottomConstant, trailingConstant: trailingConstant, width: width, height: height)
        
    }
    
    public func anchorWithReturnAnchors(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leadingConstant: CGFloat = 0, bottomConstant: CGFloat = 0, trailingConstant: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> [NSLayoutConstraint] {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }
        
        if let leading = leading {
            anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
        }
        
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }
        
        if let trailing = trailing {
            anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
        }
        
        if width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        
        if height > 0 {
           anchors.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        anchors.forEach{ $0.isActive = true }
        
        return anchors
    }
}








