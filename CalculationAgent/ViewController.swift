//
//  ViewController.swift
//  CalculationAgent
//
//  Created by Dan on 2018/6/16.
//  Copyright © 2018年 Dan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet var LoanAmountText: UITextField!
    @IBOutlet var RateText: UITextField!
    @IBOutlet var MonthText: UITextField!
    @IBOutlet var MonthPayText: UILabel!
    @IBOutlet var TotalPayText: UILabel!
    
    @IBOutlet var CheckLoanAmountDetailButton: UIButton!
    var payDetailList:[EveryMonthPayDetail] = [EveryMonthPayDetail(monthNumber: 0, monthPricipalDetail: 0, monthIntersetDetail: 0, monthPricipalBalanceDetail: 0)]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view, typically from a nib.
        LoanAmountText.keyboardType = .decimalPad
        LoanAmountText.returnKeyType = .done
        LoanAmountText.delegate = self
        
        RateText.keyboardType = .decimalPad
        RateText.returnKeyType = .done
        RateText.delegate = self
        
        MonthText.keyboardType = .decimalPad
        MonthText.returnKeyType = .done
        MonthText.delegate = self
        
        MonthPayText.text = ""
        TotalPayText.text = ""
        
        CheckLoanAmountDetailButton.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func CheckLoanAmountDetail(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "CheckLoanDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "CheckLoanDetail" {
            
            let secondVC = segue.destination as! DetailTableViewController
            secondVC.receivePayDetailList = payDetailList
            
            
        }
    }
    
    @IBAction func Clear(_ sender: UIButton)
    {
        LoanAmountText.text = ""
        RateText.text = ""
        MonthText.text = ""
        MonthPayText.text = ""
        TotalPayText.text = ""
        
        CheckLoanAmountDetailButton.isHidden = true
        
    }
    
    
    @IBAction func StartCalculation(_ sender: UIButton)
    {
        print("in func")
        if LoanAmountText.text == "" || RateText.text == "" || MonthText.text == ""
        {
            //製作警告視窗
            let alert = UIAlertController(title: "Can't calculation", message: "Information can not be blank！", preferredStyle: .alert)
            //加上視窗上的按鈕
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            //顯示警告視窗
            self.present(alert, animated: true, completion: nil)
            return
        }
        else
        {
            payDetailList.removeAll()
            var P:Double! = Double(LoanAmountText.text!)
            var r:Double! = Double(RateText.text!)
            r = r/100
            let n:Int! = Int(MonthText.text!)
            var M:Double = 0
            var monthPay: Double = 0
            var totalPay: Double = 0
            var monthInterest: Double = 0
            var monthPrincipal: Double = 0
            
            //應付本息金額之平均攤還率
            M = (pow(Double(1 + r/12), Double(n))*(r/12)) / (pow((1 + r/12), Double(n)) - 1)
            //平均每月應攤付本息金額
            monthPay = Double(P) * M
            print(String(format:"連本帶利月繳金額為 %d", lround(monthPay)))
            
            totalPay = monthPay * Double(n)
            print("連本帶利共繳金額為 ： \(Int(totalPay)) 元")
            
            MonthPayText.text = "本息月繳金額：\(Int(monthPay)) 元"
            TotalPayText.text = "連本帶利共繳金額為：\(Int(totalPay)) 元"
            CheckLoanAmountDetailButton.isHidden = false
            for i in 1...n
            {

                //每月應付利息金額
                monthInterest = P * (r/12)


                //每月應還本金金額
                monthPrincipal = monthPay - monthInterest

                P = P - monthPrincipal
                print("第\(i)期, 應繳本金為 : \(lround(monthPrincipal)) 元, 應繳利息為 : \(lround(monthInterest)) 元, 本金尚餘 : \(Int(P))")
                payDetailList.append(EveryMonthPayDetail(monthNumber: i, monthPricipalDetail: Int(lround(monthPrincipal)), monthIntersetDetail: Int(lround(monthInterest)), monthPricipalBalanceDetail: Int(P)))
            }
            
        }
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool
//    {
//        // 結束編輯 把鍵盤隱藏起來
//        self.view.endEditing(true)
//        
//        return true
//    }
    
}

