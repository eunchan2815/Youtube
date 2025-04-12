//
//  MoyaProvider.swift
//  Youtube
//
//  Created by dgsw30 on 4/9/25.
//

import Foundation
import Moya

let provider = MoyaProvider<YoutubeAPI>(plugins: [APIEventLogger()])
