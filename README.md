# SimpleOpenMailer - Open e-Mailer in swift 3.0 application

![BackgroundImage](https://github.com/nobinuxlab/SimpleOpenMailer/blob/master/ScreenShot_01.png)

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

## Envirionment
- iOS 10.2 up
 * tested on iPhone 6
- Xcode 8
- Swift 3.0.



## Developer Programに登録なしのFree Apple IDで実機デバッグする手順
### Step 1 - Xcode on Mac

(1) General on Project Profile - Identify - Bundle Identifier -> set "unique" App ID

(2) General on Project Profile - Signing
select "Automatically manage signing" && add {your Apple ID}
 ※ Autoにしておけば「provisioning profileの設定」などの細かな設定は不要。

(3) ビルド
デバッグ先を「iPhone 6」等のシミュレータに替えてUSBで接続したデバイス名を選択し直した後、
ビルド[command+B]すると、以下エラーが出る場合がありますが、その場合は上記(1)設定を変えると解消できます。

Failed to create provisioning profile. ...Change your bundle identifier to a unique string to try again.

### Step 2 - Set iPhone to trust device

設定 - 一般 - デバイス管理 
tap デベロッパApp: {your Apple ID}
tap "信頼する"

※ 信頼した直後で自動的に起動しない場合、デバイスに転送されたアプリケーションのアイコンをクリックして実行

