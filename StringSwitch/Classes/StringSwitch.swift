import UIKit

public class StringSwitch: UIView {
    
    /// String to the left of switch
    open var leftString = NSAttributedString()
    
    /// String to the right of switch
    open var rightString = NSAttributedString()
    
    /// Font color when selected
    open var selectedStringColor = UIColor.black
    
    /// Background color when selected
    open var selectedBackgroundColor = UIColor.white
    
    /// Font color when not selected
    open var notSelectedStringColor = UIColor.white
    
    /// Background color when not selected
    open var notSelectedBackgroundColor = UIColor.gray
    
    /// Left and right overlapping parts
    open var overlapWidth: CGFloat = 10
    
    /// Cursor Margin
    open var cursorMargin: CGFloat = 1
    
    /// Animation duration
    open var animateDuration = 0.1
    
    /// Animation option
    open var animateOption = UIViewAnimationOptions.curveEaseIn
    
    /// Which is selected
    private(set) open var isLeft = true
    
    /// Select area on the left
    private let leftButton = UIButton()
    
    /// Select area on the right
    private let rightButton = UIButton()
    
    /// Selection cursor
    private let cursor = UIView()
    
    public override func layoutSubviews() {
        self.cursor.backgroundColor = self.selectedBackgroundColor
        self.cursor.isUserInteractionEnabled = false
        self.cursor.frame = CGRect(x: self.isLeft ? cursorMargin : self.frame.width / 2 - cursorMargin, y: cursorMargin, width: self.frame.width / 2 + self.overlapWidth, height: self.frame.height - cursorMargin * 2)
        self.cursor.layer.cornerRadius = (self.frame.height - cursorMargin * 2) / 2
        
        self.leftButton.frame = CGRect(x: overlapWidth / 2, y: 0, width: self.frame.width / 2, height: self.frame.height)
        var leftAttributed = leftString.attributes(at: 0, effectiveRange: nil)
        leftAttributed[NSAttributedStringKey.foregroundColor] = selectedStringColor
        self.leftButton.setAttributedTitle(NSAttributedString(string: leftString.string, attributes: leftAttributed), for: .normal)
        self.leftButton.addTarget(self, action: #selector(StringSwitch.onLeft), for: .touchUpInside)
        
        self.rightButton.frame = CGRect(x: self.frame.width / 2 - overlapWidth / 2, y: 0, width: self.frame.width / 2, height: self.frame.height)
        var rightAttributed = rightString.attributes(at: 0, effectiveRange: nil)
        rightAttributed[NSAttributedStringKey.foregroundColor] = notSelectedStringColor
        self.rightButton.setAttributedTitle(NSAttributedString(string: rightString.string, attributes: rightAttributed), for: .normal)
        self.rightButton.addTarget(self, action: #selector(StringSwitch.onRight), for: .touchUpInside)
        
        self.backgroundColor = self.notSelectedBackgroundColor
        self.layer.cornerRadius = self.frame.height / 2
        
        self.addSubview(cursor)
        self.addSubview(leftButton)
        self.addSubview(rightButton)
    }
    
    @objc func onLeft() {
        if !isLeft {
            var leftAttributed = leftString.attributes(at: 0, effectiveRange: nil)
            leftAttributed[NSAttributedStringKey.foregroundColor] = selectedStringColor
            self.leftButton.setAttributedTitle(NSAttributedString(string: leftString.string, attributes: leftAttributed), for: .normal)
            
            var rightAttributed = rightString.attributes(at: 0, effectiveRange: nil)
            rightAttributed[NSAttributedStringKey.foregroundColor] = notSelectedStringColor
            self.rightButton.setAttributedTitle(NSAttributedString(string: rightString.string, attributes: rightAttributed), for: .normal)
            
            UIView.animate(withDuration: animateDuration, delay: 0, options: animateOption, animations: {
                self.cursor.frame.origin.x = self.cursorMargin
            }, completion: { _ in
                self.isLeft = true
            })
        }
    }
    
    @objc func onRight() {
        var leftAttributed = leftString.attributes(at: 0, effectiveRange: nil)
        leftAttributed[NSAttributedStringKey.foregroundColor] = notSelectedStringColor
        self.leftButton.setAttributedTitle(NSAttributedString(string: leftString.string, attributes: leftAttributed), for: .normal)
        
        var rightAttributed = rightString.attributes(at: 0, effectiveRange: nil)
        rightAttributed[NSAttributedStringKey.foregroundColor] = selectedStringColor
        self.rightButton.setAttributedTitle(NSAttributedString(string: rightString.string, attributes: rightAttributed), for: .normal)
        if isLeft {
            UIView.animate(withDuration: animateDuration, delay: 0, options: animateOption, animations: {
                self.cursor.frame.origin.x = self.frame.width / 2 - self.overlapWidth - self.cursorMargin
            }, completion: { _ in
                self.isLeft = false
            })
        }
    }
}
