//// The MIT License (MIT)
////
//// Copyright (c) 2015 James Tang (j@jamztang.com)
////
//// Permission is hereby granted, free of charge, to any person obtaining a copy
//// of this software and associated documentation files (the "Software"), to deal
//// in the Software without restriction, including without limitation the rights
//// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//// copies of the Software, and to permit persons to whom the Software is
//// furnished to do so, subject to the following conditions:
////
//// The above copyright notice and this permission notice shall be included in all
//// copies or substantial portions of the Software.
////
//// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//// SOFTWARE.
//import UIKit
//
//#if !os(tvOS)
//@available(tvOS, unavailable)
//public class KeyboardLayoutConstraint: NSLayoutConstraint {
//
//    private var offset : CGFloat = 0
//    private var keyboardVisibleHeight : CGFloat = 0
//
//    //    public override var firstItem: AnyObject?{
//    //        set{
//    //            self.firstItem = newValue
//    //        } get {
//    //            self.firstItem
//    //        }
//    //    }
//    //
//    //    public override var secondItem: AnyObject? {
//    //        set{
//    //            self.secondItem = newValue
//    //        } get {
//    //            self.secondItem
//    //        }
//    //    }
//    //
//    //    public override var firstAttribute: NSLayoutConstraint.Attribute {
//    //        set{
//    //            self.firstAttribute = newValue
//    //        } get {
//    //            self.firstAttribute
//    //        }
//    //    }
//    //
//    //    public override var secondAttribute: NSLayoutConstraint.Attribute {
//    //        set{
//    //            self.secondAttribute = newValue
//    //        } get {
//    //            self.secondAttribute
//    //        }
//    //    }
//    //
//    //    public override var relation: NSLayoutConstraint.Relation {
//    //        set{
//    //            super.relation = newValue
//    //        } get {
//    //            self.relation
//    //        }
//    //    }
//    //
//    //    public override var multiplier: CGFloat {
//    //        set{
//    //            self.multiplier = newValue
//    //        } get {
//    //            self.multiplier
//    //        }
//    //    }
//    //
//    //    public override var constant: CGFloat {
//    //        set{
//    //            super.constant = newValue
//    //        } get {
//    //            self.constant
//    //        }
//    //    }
//
//    @available(tvOS, unavailable)
//    override public func awakeFromNib() {
//        super.awakeFromNib()
//
//        offset = constant
//
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardLayoutConstraint.keyboardWillShowNotification(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardLayoutConstraint.keyboardWillHideNotification(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
//    }
//
//    @available(iOS 6.0, *)
//    public convenience init(item view1: Any, attribute attr1: NSLayoutConstraint.Attribute, toItem view2: Any?, attribute attr2: NSLayoutConstraint.Attribute, multiplier: CGFloat, constant c: CGFloat) {
//        self.init(item: view1, attribute: attr1, relatedBy: .equal, toItem: view2, attribute: attr2, multiplier: multiplier, constant: c)
//        offset = constant
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardLayoutConstraint.keyboardWillShowNotification(_:)), name: UIWindow.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardLayoutConstraint.keyboardWillHideNotification(_:)), name: UIWindow.keyboardWillHideNotification, object: nil)
//    }
//
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    // MARK: Notification
//
//    @objc func keyboardWillShowNotification(_ notification: Notification) {
//        if let userInfo = notification.userInfo {
//            if let frameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
//                let frame = frameValue.cgRectValue
//                keyboardVisibleHeight = frame.size.height
//            }
//
//            self.updateConstant()
//            switch (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber) {
////            case let (.some(duration), .some(curve)):
//            case (_,_):
////                let options = UIView.AnimationOptions(rawValue: curve.uintValue)
//                let options = UIView.AnimationOptions.curveEaseIn
//                let duration: NSNumber = 3.0
//                UIView.animate(
//                    withDuration: TimeInterval(duration.doubleValue),
//                    delay: 0,
//                    options: options,
//                    animations: {
//                        UIApplication.shared.keyWindow?.layoutIfNeeded()
//                        return
//                    }, completion: { finished in
//                    })
//            default:
//
//                break
//            }
//
//        }
//
//    }
//
//    @objc func keyboardWillHideNotification(_ notification: NSNotification) {
//        keyboardVisibleHeight = 0
//        self.updateConstant()
//
//        if let userInfo = notification.userInfo {
//
//            switch (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber, userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber) {
//            case let (.some(duration), .some(curve)):
//
//                let options = UIView.AnimationOptions(rawValue: curve.uintValue)
//
//                UIView.animate(
//                    withDuration: TimeInterval(duration.doubleValue),
//                    delay: 0,
//                    options: options,
//                    animations: {
//                        UIApplication.shared.keyWindow?.layoutIfNeeded()
//
//                        return
//                    }, completion: { finished in
//                    })
//            default:
//                break
//            }
//        }
//    }
//
//    func updateConstant() {
//        self.constant = offset - keyboardVisibleHeight
//    }
//
//}
//#endif
