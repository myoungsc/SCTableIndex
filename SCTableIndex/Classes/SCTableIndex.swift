//
//  SCIndexTable.swift
//  Pods-SCTableIndex_Example
//
//  Created by myoungsc on 2017. 11. 9..
//

import UIKit

@objc public protocol SCTableIndexDelegate: class {
    func scTableIndexReturnInitialText(_ strInitial: String, index: Int)
}

public class SCTableIndex: UIView {
    
    weak public var delegate: SCTableIndexDelegate?
    
    let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var arrItem: [String] = []
    public var initialFont: UIFont?
    public var initialTextColor: UIColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
    var dicInitials: [String: Int] = [:]
    
    public required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
    }
    
    public override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    //MARK: ## view init method ##
    public func setView(_ item: [String]) {
        self.backgroundColor = UIColor.clear
        arrItem = item
        
        for (i, element) in arrItem.enumerated() {
            for ch in element.unicodeScalars {
                setNamefirstInitial(ch.value, index: i, str: element.first!)
                break
            }
        }
        
        let initialDicKeys = dicInitials.keys.sorted()
        
        var fBtnHeight: CGFloat = 15, fBtnY: CGFloat = 0
        if (screenHeight-60) / CGFloat(initialDicKeys.count) > 15 {
            fBtnHeight = (screenHeight-60) / CGFloat(dicInitials.count)
        }
        fBtnY = ((screenHeight-(fBtnHeight*CGFloat(initialDicKeys.count))) / 2.0) - 10

        for element in initialDicKeys {
            let btnInitial: UIButton = UIButton(frame: CGRect(x: 0, y: fBtnY, width: 20, height: fBtnHeight))
            btnInitial.setTitle(element, for: .normal)
            if let font: UIFont = initialFont {
                btnInitial.titleLabel?.font = font
            }
            btnInitial.setTitleColor(initialTextColor, for: .normal)
            btnInitial.addTarget(self, action: #selector(btnInitialB(_:)), for: .touchUpInside)
            self.addSubview(btnInitial)
            
            fBtnY += fBtnHeight
        }
    }
    
    //MARK: ## Button method ##
    @objc func btnInitialB(_ sender: UIButton) {
        guard let initial: String = sender.titleLabel?.text, initial.count != 0 else {
            print("Not initial text")
            return
        }
        delegate?.scTableIndexReturnInitialText(initial, index: dicInitials[initial]!)
    }
    
    //MARK: ## etc method ##
    func setNamefirstInitial(_ initial: uint, index: Int, str: Character) { // set korean initial
        let arrKoreaInitials: [String] = ["ㄱ","ㄲ","ㄴ","ㄷ","ㄸ","ㄹ","ㅁ","ㅂ","ㅃ","ㅅ","ㅆ","ㅇ","ㅈ","ㅉ","ㅊ","ㅋ","ㅌ","ㅍ","ㅎ"]
        
        if initial >= 44032 && initial <= 55203 { // korean
            let unicode = initial-44032
            let resultInitial = unicode / 21 / 28
            if !dicInitials.keys.contains(arrKoreaInitials[Int(resultInitial)]) {
                dicInitials[arrKoreaInitials[Int(resultInitial)]] = index
            }
        } else { // Other Language
            if !dicInitials.keys.contains(String(str)) {
                dicInitials[String(str)] = index
            }
        }
    }
    
}

