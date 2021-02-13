//
//  CommentViewController.swift
//  Instagram
//
//  Created by 吉川亀勝 on 2021/02/10.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentTextField: UITextField!
    
    // 受け取る値を格納する変数を用意する
    var outputValue : PostData!
    
    @IBAction func postButton(_ sender: Any) {
        
        // コメントが入力させれるTextFieldを代入
        let comments = self.commentTextField.text!
        
        // 名前を取得して代入
        let names = Auth.auth().currentUser?.displayName
        
        // コメントt名前を同時に保存する為にまとめて代入
        let commentName = comments + " : " + names!
        
        let updateValue: FieldValue
            updateValue = FieldValue.arrayUnion([commentName])
        
        // 保存先を取得して代入
        let post = Firestore.firestore().collection(Const.PostPath).document(outputValue!.id)
        // commenntを更新
            post.updateData(["comment": updateValue])
        
            // HUDで投稿完了を表示する
            SVProgressHUD.showSuccess(withStatus: "投稿しました")
            // 投稿処理が完了したので先頭画面に戻る
           UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
        
        }
    
    
    @IBAction func cancelButton(_ sender: Any) {
        
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
