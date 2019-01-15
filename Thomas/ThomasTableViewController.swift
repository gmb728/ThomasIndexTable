//
//  ThomasTableViewController.swift
//  Thomas
//
//  Created by Chang Sophia on 1/11/19.
//  Copyright © 2019 Chang Sophia. All rights reserved.
//

import UIKit

class ThomasTableViewController: UITableViewController {
    
    let engines = ["Annie", "Arthur", "Ashima", "Bash", "Belle", "Ben", "Bertie", "Bill", "Billy", "Butch", "Carlos", "Charlie", "Clarabel", "Colin", "Daisy", "Dart", "Dash", "Den", "Dennis", "Diesel", "Donald", "Douglas", "Duck", "Duncan", "Edward", "Elizabeth", "Emily", "Etienne", "Fergus", "Frankie", "Fredinand", "Gordon", "Henry", "Iron Bert", "Iron's arry", "James", "Mike", "Percy", "Rex", "Ryan", "Thomas", "Toby"]
    
    var enginesDict = [String: [String]]()
    var engineSectionTitles = [String]()
    let engineIndexTiles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    // 將所有字母加入索引清單
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // 產生engine字典
       createEngineDict()
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    override func numberOfSections(in tableView: UITableView) -> Int {
        //回傳區塊的總數
        return engineSectionTitles.count
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        //回傳區塊的全部列數
        let engineKey = engineSectionTitles[section]
         //使用guard關鍵字來判斷字典是否以指定的engineKey來回傳一有效陣列，若否則回傳0
        guard let engineValues = enginesDict[engineKey] else {
            return 0
            }
            return engineValues.count
        }
        
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //回傳不同區塊的表頭標題
        return engineSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        //回傳區塊索引，區塊索引值為使用者按下特定索引時，表格視圖跳至區塊的值
            guard let index = engineSectionTitles.index(of: title) else {
                return -1
            }
            
            return index
        }
        
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //回傳特定區塊的表格資料
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Cell的設定
        let engineKey = engineSectionTitles[indexPath.section]
        if let engineValues = enginesDict[engineKey]{
            cell.textLabel?.text = engineValues[indexPath.row]
            
            //以下低線來取代所有出現的空格，顯示圖片
            let imageFilename = engineValues[indexPath.row]
            cell.imageView?.image = UIImage(named: imageFilename)
        }
        
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        //回傳顯示在表格右邊的索引列表標題
        return engineSectionTitles
    }
   
    // MARK: - UITableViewDelegate

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int)->CGFloat{
        // 區塊標題高度
            return 50
}
        
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        //指定headerView的顏色字型大小
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundView?.backgroundColor = UIColor(red: 236.0/255.0, green: 240.0/255.0, blue: 241.0/255.0, alpha: 1.0)
        headerView.textLabel?.textColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        
        headerView.textLabel?.font = UIFont(name: "Avenir", size: 25.0)
    }
       
     func createEngineDict(){
            for engine in engines {
                //取得engine名字的第一個字母並建立字典
                let firstLetterIndex = engine.index(engine.startIndex, offsetBy: 1)//取得特定位置起始索引值字首為１
                let engineKey = String(engine[..<firstLetterIndex])//切割成子字串至指定的索引
                if var engineValues = enginesDict[engineKey] {
                    engineValues.append(engine)
                    enginesDict[engineKey] = engineValues
                } else {
                    enginesDict[engineKey] = [engine]
                }
            }
        //從字典的key取得區塊標題並做昇冪排列（sorted)
            engineSectionTitles = [String](enginesDict.keys)
            engineSectionTitles = engineSectionTitles.sorted(by: { $0 < $1 }) //closure
        }
}

