//
//  ViewController.swift
//  SCTableIndex
//
//  Created by myoungsc.dev@gmail.com on 11/09/2017.
//  Copyright (c) 2017 myoungsc.dev@gmail.com. All rights reserved.
//

import UIKit
import SCTableIndex

class ViewController: UIViewController {

    @IBOutlet weak var tbMain: UITableView!
    @IBOutlet weak var sctbindex: SCTableIndex!
    
    var arrItem: [String] = ["김나영", "명수창", "佳奈", "정수", "한소리", "최경애", "myoung", "jungsu", "한요셉", "류성탁", "배미경",
                             "신유동", "문희준", "원빈", "abc", "이수", "워너비", "나준호", "파투", "카투소", "피를로", "박지성", "안정환",
                             "배수지", "拓也", "수지", "기무라타큐야", "도현주", "사수", "부사수", "치차리토", "강태호", "장한글", "Daieq",
                             "qudkf", "המהות הזהה", "qudifhe", "大輔", "윤사랑"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Need item sort, not sorted that wrong result
        arrItem.sort()
        
        print(arrItem)
        
        sctbindex.delegate = self
        //Use Selector Font, HelveticaNeue-Medium is Normal Font
//      sctbindex.initialFont = UIFont(name: "HelveticaNeue-Medium", size: 13)!
        //Use Selector initial Text Color, black is Normal Color
//        sctbindex.initialTextColor = UIColor(red: 50.0/255.0, green: 50.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        //String Array item
        sctbindex.setView(arrItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: SCTableIndexDelegate {
    // Move starting point item that select initial text
    func scTableIndexReturnInitialText(_ strInitial: String, index: Int) {
        tbMain.scrollToRow(at: IndexPath(row: index, section: 0), at: .top, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItem.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { //높이
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellMain
        cell.lbName.text = arrItem[indexPath.row]
        
        return cell
    }
}
