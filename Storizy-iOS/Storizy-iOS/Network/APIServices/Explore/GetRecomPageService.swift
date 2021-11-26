//
//  GetRecomPageService.swift
//  Storizy-iOS
//
//  Created by 임수정 on 2021/11/26.
//

import Foundation
import Alamofire

struct GetRecomPageService {
    
    static let shared = GetRecomPageService()
    
    func getRecomPages(accessToken: String, completionHandler: @escaping (ResponseCode, Any) -> (Void)) {

        let url = APIUrls.getRecomPageURL
        let header: HTTPHeaders = [ "Content-Type": "application/json"
                                    ,"Authorization": accessToken]
        
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let status = response.response?.statusCode else { return }
                guard let body =  response.value else { return }
                
                let str = String(decoding: body, as: UTF8.self)
                print(str)
                // 상태 코드 처리
                var responseCode: ResponseCode = .success
                if status == 200 {
                    print("추천 페이지 조회 성공")
                    responseCode = .success
                    
                    // response body 파싱
                    let decoder = JSONDecoder()
                    guard let responseBody = try? decoder.decode(ResponseData<[PageDetailData]>.self, from: body) else { return }
                    print(responseBody)
                    
                    // 응답 결과 전송
                    completionHandler(responseCode, responseBody)
                } else {
                    print("추천 페이지 조회 실패")
                    print(body)
                    responseCode = .serverError
                    completionHandler(.serverError, "serverError")
                }
                
            case .failure(let error):
                print(error)
                completionHandler(.requestError, "request fail")
            }
        }
    }
    
    
}
