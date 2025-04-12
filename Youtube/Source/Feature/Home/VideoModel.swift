struct VideoResponse: Codable {
    let videos: [VideoModel]
}

struct VideoModel: Codable {
    let title: String?
    let url: String?
    let id: String?
    let uploader: String?
    let uploaderChannelId: String?
    let uploaderChannelUrl: String?
    let uploaderProfileImage: String?
    let thumbnail: String?
    let duration: String?
    let description: String?
    let viewCount: String?
    let likeCount: String?
    let uploadTimeAgo: String?
}
