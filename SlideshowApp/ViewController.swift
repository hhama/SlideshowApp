//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 濱田 一 on 2017/10/03.
//  Copyright © 2017年 濱田 一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //スライドショーを表示する画面
    @IBOutlet weak var imageView: UIImageView!
    
    // 「進む」ボタン
    @IBOutlet weak var forwardButton: CustomButton!
    
    //「戻る」ボタン
    @IBOutlet weak var backButton: CustomButton!
    
    // 「再生/停止」ボタン
    @IBOutlet weak var playButton: CustomButton!
    
    //タイマー
    var timer: Timer!

    //表示する画像の数
    let imageNum = 5
    
    //表示している画像の番号
    var dispImageNo = 0
    
    //画面遷移時のdispImageNoをバックアップしておく
    var backupDispImageNo = 0
    
    //スライドショーの状態を表すフラグ
    var slideshowFlag = false
    
    //表示している画像の番号を元に画像を表示する
    func displayImage(){
        
        //画像の名前の配列
        let imageNames = [
            "flower001.JPG",
            "flower002.JPG",
            "flower003.JPG",
            "flower004.JPG",
            "flower005.JPG",
            ]
        
        //画像の番号の範囲チェック
        if dispImageNo < 0{
            dispImageNo = imageNum - 1
        }
        if dispImageNo > imageNum - 1{
            dispImageNo = 0
        }
        
        //画像の読み込み
        let name = imageNames[dispImageNo]
        let image = UIImage(named: name)
        
        //画面に画像をセット
        imageView.image = image

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //最初の写真を表示
        let image = UIImage(named: "flower001.JPG")
        imageView.image = image
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //タイマー作動中に動く関数(スライドショー)
    func updateTimer(timer: Timer){
        dispImageNo += 1
        displayImage()
    }
    
    // 遷移先Viewへパラメータの受け渡し
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のPhotoViewControllerを取得する。
        let photoViewController:PhotoViewController = segue.destination as! PhotoViewController
        
        //遷移先のPhotoViewControllerで宣言しているdispImageNoに値を代入して渡す。
        photoViewController.dispImageNo = self.dispImageNo

        backupDispImageNo = dispImageNo
    }
    
    // 再生・停止ボタン IBAction
    @IBAction func playButton(_ sender: Any) {

        if !slideshowFlag {
            slideshowFlag = true
            
            //再生ボタンを押すとタイマー作動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)

            //ボタンのタイトルを変更
            playButton.setTitle("停止", for: .normal)
        
            //進むボタン・戻るボタンを押せなくする
            forwardButton.isEnabled = false
            backButton.isEnabled = false
        
        } else {
            slideshowFlag = false
            
            // タイマーを破棄
            self.timer.invalidate()
            
            //ボタンのタイトルを変更
            playButton.setTitle("再生", for: .normal)

            //進むボタン・戻るボタンを押せるようにする
            forwardButton.isEnabled = true
            backButton.isEnabled = true
        }
    }
    
    // 進むボタン IBAction
    @IBAction func forwardButton(_ sender: Any) {
        dispImageNo += 1
        displayImage()
    }
    
    // 戻るボタン IBAction
    @IBAction func backButton(_ sender: Any) {
        dispImageNo -= 1
        displayImage()
    }
    
    // 遷移先から戻るためのメソッド
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        dispImageNo = backupDispImageNo
        displayImage()
    }
    

}

