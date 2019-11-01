//
//  HomeVC.swift
//  CheckInApp
//
//  Created by TrungNV on 11/1/19.
//  Copyright © 2019 devteam. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblCurrentDate: UILabel!
    
    @IBOutlet weak var viewSearch: UIView!
    @IBOutlet weak var tblCheckIn: UITableView!
    
    var lstEmployees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func initUI(){
        lblCurrentTime.changeToGradientText(Constants.TOP_COLOR, Constants.BOTTOM_COLOR, UIFont.systemFont(ofSize: 51.0, weight: .heavy))
        
        lblCurrentDate.changeToGradientText(Constants.TEXT_LEFT_COLOR, Constants.TEXT_RIGHT_COLOR, UIFont.systemFont(ofSize: 21.0, weight: .semibold))
        
        viewSearch.setRadius()
        
        tblCheckIn.delegate = self
        tblCheckIn.dataSource = self
        tblCheckIn.register(UINib(nibName: "EmployeeCell", bundle: nil), forCellReuseIdentifier: "EmployeeCell")
    }
    
    func initData() {
        lstEmployees = HomeVC.initFakeCheckInList()
        for i in 0...1{
            lstEmployees[i].isLate = true
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as? EmployeeCell
        cell?.configCell(lstEmployees[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

}

extension HomeVC{
    static func initFakeCheckInList() -> [Employee]{
        return [Employee("ThuyVT", "08:23", "img1"),
        Employee("YenNT", "08:21", "img2"),
        Employee("HangNT", "08:10", "img3"),
        Employee("TamVT", "08:09", "img4"),
        Employee("PhuongAnh", "07:20", "img5"),
        Employee("AnhVT", "07:20", "img0")]
    }
}

class Employee {
    var name: String?
    var checkinTime: String?
    var imageSrc: String?
    var isLate: Bool = false
    init(_ name: String, _ time: String, _ src: String) {
        self.name = name
        self.checkinTime = time
        self.imageSrc = src
    }
}
