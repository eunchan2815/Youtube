//
//  APIEventLogger.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//


import Foundation
import Moya

// MARK: - Moya API 로그 플러그인
final class APIEventLogger: PluginType {
    
    /// 요청 전에 실행
    func willSend(_ request: RequestType, target: TargetType) {
        guard let request = request.request else { return }
        
        print("🛰 NETWORK Request LOG")
        print("URL: \(request.url?.absoluteString ?? "")")
        print("Method: \(request.httpMethod ?? "")")
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        
        if let bodyData = request.httpBody, let bodyString = bodyData.toPrettyPrintedString {
            print("Body: \(bodyString)")
        }
    }
    
    /// 응답 받은 후 실행
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        print("🛰 NETWORK Response LOG")
        
        switch result {
        case .success(let response):
            print("URL: \(response.response?.url?.absoluteString ?? "")")
            print("Status Code: \(response.statusCode)")
            print("Data: \(response.data.toPrettyPrintedString ?? "")")
            
        case .failure(let error):
            print("❌ NETWORK ERROR")
            print("Error Description: \(error.localizedDescription)")
            if let response = error.response {
                print("URL: \(response.response?.url?.absoluteString ?? "")")
                print("Status Code: \(response.statusCode)")
                print("Data: \(response.data.toPrettyPrintedString ?? "")")
            }
        }
    }
}

// MARK: - Data 확장 (JSON 포맷팅)
private extension Data {
    var toPrettyPrintedString: String? {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
              let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]),
              let prettyString = String(data: jsonData, encoding: .utf8) else { return nil }
        return prettyString
    }
}
