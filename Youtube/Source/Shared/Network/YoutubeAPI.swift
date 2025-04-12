//
//  FootballAPI.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//


import Moya
import Foundation

enum YoutubeAPI {
    case fetchVideo(String)
    case fetchTrendingVideos(String, Int)
}

extension YoutubeAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://127.0.0.1:8000")!
    }
    
    var path: String {
        switch self {
        case .fetchVideo(_):
            return "/videos"
        case .fetchTrendingVideos(_, _):
            return "/trending"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchVideo(let keyword):
            return .requestParameters(parameters: ["keyword": keyword], encoding: URLEncoding.default)
        case .fetchTrendingVideos(let region, let maxResult):
            return .requestParameters(
                parameters: [
                    "region": region,
                    "max_results": maxResult
                ],
                encoding: URLEncoding.default
            )
        }
    }
    
    var headers: [String : String]? { return nil }
}
