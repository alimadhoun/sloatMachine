//
//  ViewController.swift
//  SlotMachine
//
//  Created by Ali on 4/30/21.
//  Copyright © 2021 Ali. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let armimg = UIImageView()
    let leftslot = SlotMachineView()
    let centerslot = SlotMachineView()
    let rightslot = SlotMachineView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // swipeDown GestureRecognizer
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        self.armimg.addGestureRecognizer(swipeDown)
        self.armimg.isUserInteractionEnabled = true
        view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        
        //Main View
        let mainview = UIView()
        mainview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainview)
        mainview.backgroundColor = UIColor.clear
        mainview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainview.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainview.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier: 0.8).isActive = true
        mainview.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.25).isActive = true
        
       
        
        
        
        // the left slot
        
        leftslot.translatesAutoresizingMaskIntoConstraints = false
        mainview.addSubview(leftslot)
        leftslot.leadingAnchor.constraint(equalTo: mainview.leadingAnchor).isActive = true
        leftslot.topAnchor.constraint(equalTo: mainview.topAnchor).isActive = true
        leftslot.bottomAnchor.constraint(equalTo: mainview.bottomAnchor).isActive = true
        leftslot.widthAnchor.constraint(equalTo: mainview.widthAnchor,multiplier: 0.25).isActive = true
        
        //setupdata
        leftslot.images.append("Fruit-Spins"._img)
        leftslot.images.append("Fruit-Bar"._img)
        leftslot.images.append("Fruit-Bell"._img)
        leftslot.images.append("Fruit-Cherry"._img)
        leftslot.images.append("Fruit-Diamond"._img)
        leftslot.images.append("Fruit-Grapes"._img)
        leftslot.images.append("Fruit-Lemon"._img)
        leftslot.images.append("Fruit-Orange"._img)
        leftslot.images.append("Fruit-Plum"._img)
        leftslot.images.append("Fruit-Watermelon"._img)
        
        // the centered slot
        
        centerslot.translatesAutoresizingMaskIntoConstraints = false
        mainview.addSubview(centerslot)
        centerslot.leadingAnchor.constraint(equalTo: leftslot.trailingAnchor,constant: 5).isActive = true
        centerslot.topAnchor.constraint(equalTo: mainview.topAnchor).isActive = true
        centerslot.bottomAnchor.constraint(equalTo: mainview.bottomAnchor).isActive = true
        centerslot.widthAnchor.constraint(equalTo: mainview.widthAnchor,multiplier: 0.25).isActive = true
        
        //setupdata
        centerslot.images.append("Fruit-Spins"._img)
        centerslot.images.append("Number-10"._img)
        centerslot.images.append("Number-Question"._img)
        centerslot.images.append("Number-20"._img)
        centerslot.images.append("Number-100"._img)
        
        
        
        
        //create the right slot
        
        rightslot.translatesAutoresizingMaskIntoConstraints = false
        mainview.addSubview(rightslot)
        rightslot.leadingAnchor.constraint(equalTo: centerslot.trailingAnchor,constant: 5).isActive = true
        rightslot.topAnchor.constraint(equalTo: mainview.topAnchor).isActive = true
        rightslot.bottomAnchor.constraint(equalTo: mainview.bottomAnchor).isActive = true
        rightslot.widthAnchor.constraint(equalTo: mainview.widthAnchor,multiplier: 0.25).isActive = true
        //setupdata
        
        rightslot.images.append("Fruit-Spins"._img)
        rightslot.images.append("Fruit-Bell"._img)
        rightslot.images.append("Fruit-Cherry"._img)
        rightslot.images.append("Fruit-Lemon"._img)
        rightslot.images.append("Fruit-Grapes"._img)
        rightslot.images.append("Fruit-Watermelon"._img)
        rightslot.images.append("Fruit-Bar"._img)
        rightslot.images.append("Fruit-Orange"._img)
        rightslot.images.append("Fruit-Plum"._img)
        rightslot.images.append("Fruit-Diamond"._img)
        
        
        //setup the arm img
        armimg.contentMode = .scaleAspectFit
        armimg.image = UIImage.init(named: "single_mot")
        mainview.addSubview(armimg)
        armimg.translatesAutoresizingMaskIntoConstraints = false
        armimg.centerYAnchor.constraint(equalTo: mainview.centerYAnchor).isActive = true
        armimg.heightAnchor.constraint(equalTo: mainview.heightAnchor,multiplier: 0.5).isActive = true
        armimg.trailingAnchor.constraint(equalTo: rightslot.trailingAnchor,constant: 32).isActive = true
        armimg.widthAnchor.constraint(equalTo: rightslot.widthAnchor, multiplier: 0.4).isActive = true
        
        
        rightslot.picker.selectRow((rightslot.images.count * 10) - 1, inComponent: 0, animated: false)
        centerslot.picker.selectRow((centerslot.images.count * 3) - 1, inComponent: 0, animated: false)
        leftslot.picker.selectRow((leftslot.images.count * 10) - 1, inComponent: 0, animated: false)

    }
    
    func spinAction(){
        self.armimg.isUserInteractionEnabled = false // disable clicking
        // animation of bandit handle
        startanimation(view: armimg, images: #imageLiteral(resourceName: "mot").spriteSheet(cols: 14, rows: 1), duration: 0.5, repeatCount: 1)
        //userIndicatorlabel.text = ""
        //Model.instance.play(sound: Constant.spin_sound)
        //roll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.armimg.isUserInteractionEnabled = true
        }
        roll()
    }
    func roll(){ // roll pickerview
           var delay : TimeInterval = 0
           // iterate over each component, set random img
               DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                self.startanimation(picker: self.centerslot.picker, lastindex: self.centerslot.images.count - 1)
                self.startanimation(picker: self.leftslot.picker, lastindex: self.leftslot.images.count - 1)
                self.startanimation(picker: self.rightslot.picker, lastindex: self.rightslot.images.count - 1)
               })
               delay += 0.5
           
       }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down:
                self.spinAction()
                
            default:break
            }
        }
    }
    func startanimation(picker:UIPickerView, lastindex:Int){
        var counter = lastindex-1
        
        var delay = 0.0
        if picker.selectedRow(inComponent: 0) != 0 {
            while counter != 0 {
                 DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    picker.selectRow(counter, inComponent: 0, animated: true)
                       })
                        counter = counter - 1
                       delay = delay + 1
            }
        }else{
            counter = lastindex
            picker.selectRow(lastindex, inComponent: 0, animated: false)
            startanimation(picker: picker, lastindex: counter)
        }

    }
}


extension UIViewController{
    func startanimation(view : UIImageView, images : [UIImage] , duration : TimeInterval , repeatCount : Int){
        view.animationImages = images
        view.animationDuration = duration
        view.animationRepeatCount = repeatCount
        view.startAnimating()
    }
}
extension UIImage{
    
    func spriteSheet(cols : UInt, rows : UInt) -> [UIImage]{
        
        let w = self.size.width / CGFloat(cols)
        let h = self.size.height / CGFloat(rows)
        
        var rect = CGRect(x: 0, y: 0, width: w, height: h)
        var arr : [UIImage] = []
        
        for _ in 0..<rows{
            for _ in 0..<cols{
                
                //crop
                let subImage = self.crop(rect)
                //add to array
                arr.append(subImage)
                
                //go to next image in row
                rect.origin.x += w
            }
            
            //go to next row
            rect.origin.x = 0
            rect.origin.y += h
        }
        
        //done, return the array
        return arr
        
    }
    
    
    func crop(_ rect : CGRect) -> UIImage{
        guard let imageRef = self.cgImage?.cropping(to: rect) else {
            return UIImage()
        }
        return UIImage(cgImage: imageRef)
    }
  
}
extension String{
    var _img:UIImage{
        let image = UIImage(named: self)!
        return image
    }
}
