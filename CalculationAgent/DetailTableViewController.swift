//
//  DetailTableViewController.swift
//  CalculationAgent
//
//  Created by Dan on 2018/6/17.
//  Copyright © 2018年 Dan. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController
{
    var receivePayDetailList: [EveryMonthPayDetail] = [EveryMonthPayDetail(monthNumber: 0, monthPricipalDetail: 0, monthIntersetDetail: 0, monthPricipalBalanceDetail: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = 120
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return receivePayDetailList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailTableViewCell
        cell.numberOfMonth.text = "第\(receivePayDetailList[indexPath.row].monthNumber)期"
        cell.principal.text = "本金為：\(receivePayDetailList[indexPath.row].monthPricipalDetail)元"
        cell.interset.text = "利息為：\(receivePayDetailList[indexPath.row].monthIntersetDetail)元"
        cell.principalBalance.text = "本金尚餘：\(receivePayDetailList[indexPath.row].monthPricipalBalanceDetail)元"

        // Configure the cell...

        return cell
    }
    
}
