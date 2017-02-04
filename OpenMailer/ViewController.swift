//
//  ViewController.swift
//  openMailer
//
//  Created by Nobukazu Tanaka on 2017/02/01.
//  Copyright © 2017年 nobinux.home. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func tapEmailerButton(_ sender: Any) {
        // メール送信可能な環境でメーラー起動
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self // delegate
            mail.setToRecipients([""])  // To : set blank
            mail.setSubject(textTitle.text!) // Subject
            mail.setMessageBody(textMessageBody.text, isHTML: false) // メール本文
            
            //メーラー画面呼び出し
            self.present(mail, animated: true, completion: nil)
        } else {
            print("メーラー起動に失敗しました")
        }
    }

    // 別画面で開いたメーラーを操作終了後に閉じる
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case MFMailComposeResult.cancelled:
            print("メール送信がキャンセルされました")
        case MFMailComposeResult.saved:
            print("メールが下書きとして保存されました")
        case MFMailComposeResult.failed:
            print("メール送信に失敗しました")
        default:
            break
        }
        // メーラーを閉じる
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textMessageBody: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

