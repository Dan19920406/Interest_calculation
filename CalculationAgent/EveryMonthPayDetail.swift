//
//  EveryMonthPayDetail.swift
//  CalculationAgent
//
//  Created by Dan on 2018/6/17.
//  Copyright © 2018年 Dan. All rights reserved.
//

import Foundation
class EveryMonthPayDetail
{
    var monthNumber = 0
    var monthPricipalDetail = 0
    var monthIntersetDetail = 0
    var monthPricipalBalanceDetail = 0
    init(monthNumber:Int, monthPricipalDetail: Int, monthIntersetDetail: Int, monthPricipalBalanceDetail: Int)
    {
        self.monthNumber = monthNumber
        self.monthPricipalDetail = monthPricipalDetail
        self.monthIntersetDetail = monthIntersetDetail
        self.monthPricipalBalanceDetail = monthPricipalBalanceDetail
    }
    
}
