//
//  UIView+Layout.swift
//  AppStoreJSONApis
//
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, width: NSLayoutDimension? = nil, height: NSLayoutDimension? = nil, topConstant: CGFloat = 0, leadingConstant: CGFloat = 0, trailingConstant: CGFloat = 0, bottomConstant: CGFloat = 0, centerXConstant: CGFloat = 0, centerYConstant: CGFloat = 0, widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) {
      translatesAutoresizingMaskIntoConstraints = false
      var anchors = [NSLayoutConstraint]()
      
      if let top = top {
        anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
      }
      
      if let leading = leading {
        anchors.append(leadingAnchor.constraint(equalTo: leading, constant: leadingConstant))
      }
      
      if let trailing = trailing {
        anchors.append(trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant))
      }
      
      if let bottom = bottom {
        anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
      }
      
      if let centerX = centerX {
        anchors.append(centerXAnchor.constraint(equalTo: centerX, constant: centerXConstant))
      }
      
      if let centerY = centerY {
        anchors.append(centerYAnchor.constraint(equalTo: centerY, constant: centerYConstant))
      }
      
      if let width = width {
        anchors.append(widthAnchor.constraint(equalTo: width, constant: widthConstant))
      } else if widthConstant != 0 {
        anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
      }
      
      if let height = height {
        anchors.append(heightAnchor.constraint(equalTo: height, constant: heightConstant))
      } else if heightConstant != 0 {
        anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
      }
      
      anchors.forEach({$0.isActive = true})
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerXInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superViewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXAnchor).isActive = true
        }
    }
    
    func centerYInSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
    }
    
    func constrainWidth(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }
    
    func constrainHeight(constant: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }
}

struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
