//
//  ViewController.swift
//  Alert
//
//  Created by Nam on 2024/06/27.
//

import UIKit

class ViewController: UIViewController {

    let imgOn = UIImage(named: "lamp-on")
    let imgOff = UIImage(named: "lamp-off")
    let imgRemove = UIImage(named: "lamp-remove")
    var isLampOn = true
    var isLampRemoved = false
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var lampOn: UIButton!
    @IBOutlet var lampOff: UIButton!
    @IBOutlet var lampRemove: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
        
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn == true){   // 전구가 켜져 있을 때 alert 창 실행
            let lampOnAlert = UIAlertController(title: "WARNING", message: "Lamp is already On", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
            
        } else{
            imgView.image = imgOn
            isLampOn = true
        }
    }
    
    // 전구 끄기 1번 방법
    
//    @IBAction func btnLampOff(_ sender: UIButton) {
//        if(isLampOn == false){  // 전구가 꺼져 있을 때 alert 창 싫행
//            let lampOnAlert = UIAlertController(title: "WARNING", message: "Lamp is already Off", preferredStyle: UIAlertController.Style.alert)
//            let onAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: nil)
//            lampOnAlert.addAction(onAction)
//            present(lampOnAlert, animated: true, completion: nil)
//
//        } else {
//            imgView.image = imgOff
//            isLampOn = !isLampOn
//        }
//    }
    
    // 전구 끄기 2번 방법
    
        @IBAction func btnLampOff(_ sender: UIButton) {
            if isLampOn {  // 전구가 꺼져 있을 때 alert 창 싫행
                let lampOffAlert = UIAlertController(title: "WARNING", message: "Do you want to turn off the lamp?", preferredStyle: UIAlertController.Style.alert)
                
                // 익명함수 (클로저) 를 통해 함수 몸체만 만들어 코드 작성
                let offAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: {
                    ACTION in self.imgView.image = self.imgOff
                    self.isLampOn = false
                })
                let cancelAction = UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: nil)
                
                lampOffAlert.addAction(offAction)
                lampOffAlert.addAction(cancelAction)
                present(lampOffAlert, animated: true, completion: nil)
    
            }
        }
    
    @IBAction func btnLampRemove(_ sender: UIButton) {
        if(isLampRemoved == true){  // 전구가 제거되어 있을 때 alert 창 싫행
            let lampOnAlert = UIAlertController(title: "WARNING", message: "Lamp is already Removed", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
            
        } else {
            let lampRemoveAlert = UIAlertController(title: "Remove Lamp", message: "Remove Lamp?", preferredStyle: UIAlertController.Style.alert)
            
            // off 하는 옵션
            let offAction = UIAlertAction(title: "No, turn off", style: UIAlertAction.Style.default, handler:{
                ACTION in self.imgView.image = self.imgOff
                self.isLampOn = false
            })
            
            // on 하는 옵션
            let onAction = UIAlertAction(title: "No, turn on", style: UIAlertAction.Style.default, handler:{
                ACTION in self.imgView.image = self.imgOn
                self.isLampOn = true
            })
            
            // remove 하는 옵션
            let removeAction = UIAlertAction(title: "Yes, remove ", style: UIAlertAction.Style.default, handler:{
                ACTION in self.imgView.image = self.imgRemove
                self.isLampOn = false
            })
            
            lampRemoveAlert.addAction(offAction)
            lampRemoveAlert.addAction(onAction)
            lampRemoveAlert.addAction(removeAction)
            present(lampRemoveAlert, animated: true, completion: nil)
        }
    }
    
    
}

