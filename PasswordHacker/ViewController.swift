//
//  ViewController.swift
//  PasswordHacker
//
//  Created by 日暮駿之介 on 2022/08/25.
//

import UIKit


class ViewController: UIViewController {
    //結果表示用ラベル
    @IBOutlet var resultLabel1:UILabel!
    @IBOutlet var resultLabel2:UILabel!
    @IBOutlet var resultLabel3:UILabel!
    @IBOutlet var resultLabel4:UILabel!
    
    //カウント表示ラベル
    @IBOutlet var countLabel:UILabel!
    
    //秘密パスワード
    var password:Int=1234
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(){
        for i in 0...9999{
            
            //数字表示
            countLabel.text=String(i)
            
            //0,0005待機
            RunLoop.main.run(until:Date(timeIntervalSince1970: 0.0005))
            if i==password{
                print("正解は\(i)です！")
                var digits=[Int]()
                for _ in 0...3{
                    digits.append(password%10)
                    password=password/10
                }
                
                resultLabel1.text=String(digits[0])
                resultLabel2.text=String(digits[1])
                resultLabel3.text=String(digits[2])
                resultLabel4.text=String(digits[3])
            }
        }
    }
    
    @IBAction func reset(){
        
        //password reset 1234
        password=1234
        
        //countLabelの表示を元に戻す
        countLabel.text="「STARS」ボタンを押して解析開始"
        
        //ラベルを0に戻す
        resultLabel1.text="0"
        resultLabel2.text="0"
        resultLabel3.text="0"
        resultLabel4.text="0"
    }


}

