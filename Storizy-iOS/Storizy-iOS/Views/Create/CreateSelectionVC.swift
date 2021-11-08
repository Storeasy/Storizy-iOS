//
//  CreateSelectionVC.swift
//  Storizy-iOS
//
//  Created by 임수정 on 2021/11/07.
//

import UIKit

class CreateSelectionVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 프로젝트 생성 버튼 클릭
    @IBAction func projectCreateSelectAction(_ sender: Any) {
        let createProjectVC = self.storyboard?.instantiateViewController(identifier: "CreateProjectVC") as! CreateProjectVC
        self.navigationController?.pushViewController(createProjectVC, animated: true)

    }
    
    // 페이지 생성 버튼 클릭
    @IBAction func pageCreateSelectAction(_ sender: Any) {
        let createPageVC = self.storyboard?.instantiateViewController(identifier: "CreatePageVC") as! CreatePageVC
        self.navigationController?.pushViewController(createPageVC, animated: true)
    }
}