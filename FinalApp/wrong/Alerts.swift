//
//  Alerts.swift
//  FinalApp
//
//  Created by Winnie on 2020/6/10.
//  Copyright © 2020 Winnie. All rights reserved.
//

import UIKit

class Alerts: NSObject {

    func testAlert(controller: UIViewController){
        let alertController = UIAlertController(title: "warning", message: "You forgot to enter place!", preferredStyle: .alert)
        //let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil);
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
        print("點擊")
        }
        //alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        controller.present(alertController, animated: true, completion: nil)
    }

}
