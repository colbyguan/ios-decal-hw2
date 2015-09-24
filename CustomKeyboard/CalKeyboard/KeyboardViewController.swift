//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var yogiButton: UIButton!
    @IBOutlet var newlineButton: UIButton!
    @IBOutlet var backspaceButton: UIButton!
    let yogiisms = [
        "When you come to a fork in the road, take it.",
        "You can observe a lot by just watching.",
        "It ain't over till it's over",
        "It's like déjà vu all over again.",
        "No one goes there nowadays, it’s too crowded.",
        "Baseball is ninety percent mental and the other half is physical.",
        "A nickel ain't worth a dime anymore.",
        "Always go to other people's funerals, otherwise they won't come to yours.",
        "We made too many wrong mistakes.",
        "Congratulations. I knew the record would stand until it was broken.",
        "I want to thank everyone for making this night necessary.",
        "Take it with a grin of salt.",
        "It gets late early out here.",
        "The future ain’t what it used to be.",
        "He hits from both sides of the plate. He’s amphibious."]
    
    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
        loadTargets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
    }
    
    func loadTargets() {
        yogiButton.addTarget(self, action: "yogi", forControlEvents: .TouchUpInside)
        newlineButton.addTarget(self, action: "newline", forControlEvents: .TouchUpInside)
        backspaceButton.addTarget(self, action: "backspace", forControlEvents: .TouchUpInside)
    }
    
    func yogi() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        let idx = Int(arc4random_uniform(UInt32(yogiisms.count)))
        proxy.insertText(yogiisms[idx])
    }
    func newline() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
    }
    func backspace() {
        var proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }


}
