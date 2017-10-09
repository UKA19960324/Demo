//
//  SideButton.swift
//  Demo
//
//  Created by U.K.A on 2017/9/13.
//  Copyright © 2017年 U.K.A. All rights reserved.
//

import UIKit
var buttonsArr = [RHButtonView]()
var sideButtonsView: RHSideButtons?
extension UIViewController: RHSideButtonsDataSource , RHSideButtonsDelegate{
    
    func addSideButton() {
        let triggerButton = RHTriggerButtonView(pressedImage: UIImage(named: "exit_icon")!) {
            $0.image = UIImage(named: "trigger_img")
            $0.hasShadow = true
        }
        
        sideButtonsView = RHSideButtons(parentView: view, triggerButton: triggerButton)
        sideButtonsView?.delegate = self
        sideButtonsView?.dataSource = self
        sideButtonsView?.setTriggerButtonPosition(CGPoint(x: view.bounds.width - 53,y: view.bounds.height - 55))
        buttonsArr.removeAll()
        for index in 1...6 {
            buttonsArr.append(generateButton(withImgName: "Icon_\(index)"))
        }
        sideButtonsView?.reloadButtons()
    }
    
    func generateButton(withImgName imgName: String) -> RHButtonView {
        
        return RHButtonView {
            $0.image = UIImage(named: imgName)
            $0.hasShadow = true
        }
    }
    public func sideButtonsNumberOfButtons(_ sideButtons: RHSideButtons) -> Int {
        return buttonsArr.count
    }
    
    public func sideButtons(_ sideButtons: RHSideButtons, buttonAtIndex index: Int) -> RHButtonView {
        return buttonsArr[index]
    }

    public func sideButtons(_ sideButtons: RHSideButtons, didSelectButtonAtIndex index: Int) {
        switch index {
        // 點選 設定 iCon
        case 0:
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Setting"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                print("Setting ! ")
            }
        // 點選 關於 iCon
        case 1:
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "About"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                print("About Us ! ")
            }
        // 點選 聊天 iCon
        case 2:
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Chat"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                 print("Chat ! ")
            }
        // 點選 3D iCon
        case 3:
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "3D"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                print("3D ! ")
            }
        // 點選 好友 iCon
        case 4:
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Friends"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                print("Friends ! ")
            }
        // 點選 個人資料 iCon
        case 5:
            if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MyProfile"){
                UIApplication.shared.keyWindow?.rootViewController = viewController
                self.dismiss(animated: true, completion: nil)
                print("MyProfile ! ")
            }
        default:
            break
        }
    }
    public func sideButtons(_ sideButtons: RHSideButtons, didTriggerButtonChangeStateTo state: RHButtonState) {
        print("🍭 Trigger button")
    }
}
