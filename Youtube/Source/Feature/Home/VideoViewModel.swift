import Foundation
import Moya

class VideoViewModel: ObservableObject {
    @Published var trendingVideos: [VideoModel]?
    @Published var videos: [VideoModel]?
    
    func fetchVideos(_ keyword: String) {
        provider.request(.fetchVideo(keyword)) { result in
            switch result {
            case .success(let data):
                do {
                    let videos = try JSONDecoder()
                        .decode(VideoResponse.self, from: data.data)
                    self.videos = videos.videos
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTrendingVideos(_ region: String, _ maxResults: Int) {
        provider.request(.fetchTrendingVideos(region, maxResults)) { result in
            switch result {
            case .success(let data):
                do {
                    let videos = try JSONDecoder()
                        .decode(VideoResponse.self, from: data.data)
                    self.videos = videos.videos
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
