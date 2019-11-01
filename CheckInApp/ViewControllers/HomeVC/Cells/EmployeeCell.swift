//
//  EmployeeCell.swift
//  CheckInApp
//
//  Created by TrungNV on 11/1/19.
//  Copyright © 2019 devteam. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCheckinTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgAvatar.setRadius(imgAvatar.frame.height / 2)
        imgAvatar.layer.borderWidth = 1.5
        imgAvatar.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        subView.setRadius(5.0)
    }
    
    func configCell (_ data: Employee){
        imgAvatar.image = UIImage(named: data.imageSrc!)
        lblName.text = data.name
        lblCheckinTime.text = data.checkinTime
        lblCheckinTime.textColor = !data.isLate ? #colorLiteral(red: 0, green: 0.2760610268, blue: 0.4880948179, alpha: 1) : #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
    
}
