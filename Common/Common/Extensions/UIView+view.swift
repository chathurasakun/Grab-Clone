//
//  UIView+view.swift
//  Common
//
//  Created by CHATHURA ELLAWALA on 24/12/2024.
//

import UIKit

extension UIView {
    public func addShadow(color: UIColor = .black, radius: CGFloat = 10, opacity: Float = 0.5, offset: CGSize = .zero) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
    }
    
    /// Adds a border to the specified side(s) of the view with the given color and width.
    public func addBorder(to sides: [Side], color: UIColor, width: CGFloat) {
        for side in sides {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            
            switch side {
            case .top:
                border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: width)
            case .bottom:
                border.frame = CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width)
            case .left:
                border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.height)
            case .right:
                border.frame = CGRect(x: self.frame.width - width, y: 0, width: width, height: self.frame.height)
            }
            
            self.layer.addSublayer(border)
        }
    }
    
    /// Animates the opacity of the view on touch and resets it after a delay.
//    func addOpacityHighlightOnTap(duration: TimeInterval = 0.2, delay: TimeInterval = 0.1) {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleOpacityTap))
//        self.addGestureRecognizer(tapGesture)
//        self.isUserInteractionEnabled = true // Ensure the view can receive touches
//        
//        // Store the original opacity for resetting later
//        objc_setAssociatedObject(self, &AssociatedKeys.originalOpacity, self.layer.opacity, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        objc_setAssociatedObject(self, &AssociatedKeys.animationDuration, duration, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        objc_setAssociatedObject(self, &AssociatedKeys.animationDelay, delay, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//    }
//    
//    @objc private func handleOpacityTap() {
//        guard let originalOpacity = objc_getAssociatedObject(self, &AssociatedKeys.originalOpacity) as? Float,
//              let duration = objc_getAssociatedObject(self, &AssociatedKeys.animationDuration) as? TimeInterval,
//              let delay = objc_getAssociatedObject(self, &AssociatedKeys.animationDelay) as? TimeInterval else {
//            return
//        }
//        
//        // Reduce opacity
//        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
//        opacityAnimation.fromValue = originalOpacity
//        opacityAnimation.toValue = 0.5 // Target opacity
//        opacityAnimation.duration = duration
//        opacityAnimation.fillMode = .forwards
//        opacityAnimation.isRemovedOnCompletion = false
//        self.layer.add(opacityAnimation, forKey: "reduceOpacity")
//        
//        // Restore opacity after delay
//        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
//            let restoreAnimation = CABasicAnimation(keyPath: "opacity")
//            restoreAnimation.fromValue = 0.5
//            restoreAnimation.toValue = originalOpacity
//            restoreAnimation.duration = duration
//            restoreAnimation.fillMode = .forwards
//            restoreAnimation.isRemovedOnCompletion = false
//            self.layer.add(restoreAnimation, forKey: "restoreOpacity")
//        }
//        
//    }
}

//private struct AssociatedKeys {
//    static var originalOpacity = "originalOpacity"
//    static var animationDuration = "animationDuration"
//    static var animationDelay = "animationDelay"
//}

