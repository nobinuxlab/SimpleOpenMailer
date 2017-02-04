# SimpleOpenMailer - Open e-Mailer in swift 3.0 application

![BackgroundImage](https://raw.githubusercontent.com/nobinuxlab/SimpleOpenMailer/master/Screenshot01.png)

## Codes summary
See ViewController.swift

### Step 1 - Link MessageUI Libraries
Add MessageUI to Link Binary with Libraries at Xcode - Build Phases
And write "import MessageUI"

### Step 2 - add main code
write below codes after put any UI controls

```swift
// メール送信可能な環境でメーラー起動
func tapEmailerButton(_ sender: Any) {
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
    dismiss(animated: true, completion: nil)
}
```

## envirionment
- iOS 10.2 up
- Xcode 8
- Swift 3.0.
- test on iPhone 6
