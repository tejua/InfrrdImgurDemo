
//  DemoProject
//
//  Created by vLinkD on 23/11/19.
//  Copyright © 2019 vLinkD. All rights reserved.
//
import UIKit

/// Base class for creating an alert controller.
/// Use Alert or ActionSheet instead
public class MyAlert {
    static var isShowing: Bool = false
    static let dismissDelay = 2.0
    static let feedback: FeedbackView = {
        let feedback = FeedbackView()
        return feedback
    }()

    static func showError(message: String?) {
        guard let message = message, !message.isEmpty else { return }
        if isShowing { return }
        if Thread.isMainThread {
            if let window = UIApplication.shared.keyWindow {
                feedback.showFeedback(backgroundColor: UIColor(hex: "DA2C2A"), feedbackLabel: message, feedbackLabelColor: UIColor.white, feedbackIconImage: #imageLiteral(resourceName: "libraryCancel"), feedbackIconImageTint: UIColor.white, durationOnScreen: 3, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
            }
            isShowing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + dismissDelay) {
                isShowing = false
            }
        } else {
            DispatchQueue.main.async {
                if let window = UIApplication.shared.keyWindow {
                    self.feedback.showFeedback(backgroundColor: UIColor(hex: "DA2C2A"), feedbackLabel: message, feedbackLabelColor: UIColor.white, feedbackIconImage: #imageLiteral(resourceName: "libraryCancel"), feedbackIconImageTint: UIColor.white, durationOnScreen: 3, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
                }
                isShowing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + dismissDelay) {
                    isShowing = false
                }
            }
        }
    }

    static func showSuccess(message: String?) {
        guard let message = message, !message.isEmpty else { return }
        if isShowing { return }
        if Thread.isMainThread {
            if let window = UIApplication.shared.keyWindow {
                feedback.showFeedback(backgroundColor: UIColor(hex: "61A465"), feedbackLabel: message, feedbackLabelColor: UIColor.white, feedbackIconImage: #imageLiteral(resourceName: "libraryConfirm"), feedbackIconImageTint: UIColor.white, durationOnScreen: 2, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
            }
            isShowing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + dismissDelay) {
                isShowing = false
            }
        } else {
            DispatchQueue.main.async {
                if let window = UIApplication.shared.keyWindow {
                    self.feedback.showFeedback(backgroundColor: UIColor(hex: "61A465"), feedbackLabel: message, feedbackLabelColor: UIColor.white, feedbackIconImage: #imageLiteral(resourceName: "libraryConfirm"), feedbackIconImageTint: UIColor.white, durationOnScreen: 2, currentView: window, showsBackgroundGradient: true, isAboveTabBar: false)
                }
                isShowing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + dismissDelay) {
                    isShowing = false
                }
            }
        }
    }

   
}
