//
//  HumidityViewController.swift
//  JWTClient
//
//  Created by Antonchikov Alexander on 04/05/2018.
//

import UIKit

class HumidityViewController: UIViewController {

    @IBAction func frequencyTextField(_ sender: Any) {
        print("ddd")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Humidity")
        
        /*
         "frequency": "10", // частота проверки влажности (в сек)
         "irrigation_time": "10", // время полива  (в сек)
         "threshold": "300", // порог срабатывания на полив
        */
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
