//
//  PhotoViewController.swift
//  SlideshowApp
//
//  Created by 濱田 一 on 2017/10/04.
//  Copyright © 2017年 濱田 一. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    let imageNames = [
        "flower001.JPG",
        "flower002.JPG",
        "flower003.JPG",
        "flower004.JPG",
        "flower005.JPG",
        ]
    
    var dispImageNo:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //画像の読み込み
        let name = imageNames[dispImageNo]
        let image = UIImage(named: name)
        
        //画面に画像をセット
        imageView.image = image

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
