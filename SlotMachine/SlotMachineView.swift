//
//  SlotMachineView.swift
//  SlotMachine
//
//  Created by Ali on 4/30/21.
//  Copyright © 2021 Ali. All rights reserved.
//

import UIKit

class SlotMachineView: UIView {

    
    var picker = UIPickerView()
    var images:[UIImage] = []
    var numberofrows = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initSubviews() {
        
        self.layer.borderWidth = 4
        self.layer.borderColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.addSubview(picker)
        picker.isUserInteractionEnabled = true
        //picker.selectedRow(inComponent: images.count - 1)
        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        picker.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        picker.isUserInteractionEnabled = false
        
    }
    
    
    func startanimation(){
        
        //picker.selectRow(picker.numberOfRows(inComponent: 0)-1, inComponent: 0, animated: false)
    }
    func animate()
    {
        
    }

}
extension SlotMachineView: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if images.count == 5 {
            numberofrows = images.count * 3
            return images.count * 3
        }else {
            numberofrows = images.count * 20
            return images.count * 20
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % images.count
        let img = UIImageView(image: images[index])
        img.contentMode = .scaleAspectFill
        return img
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        
        return (self.frame.height / 3) - 20
    }
//    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//        return 30.0
//    }
//    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
//       return 40
//    }
    
    
    
    
}
