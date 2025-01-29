import Foundation

// MARK: - RecordsResponse
//struct record: Codable {
//    let records: [Record]
//}

// MARK: - Record
struct RecordsResponse: Codable {
    let records: [Record]
}

struct Record: Codable {
    let id: String
    let createdTime: String
    let fields: Boardroom
}
//struct Records: Codable {
//    let records: [Record]
//    let id: String
//    let createdTime: String
//    let fields: Boardroom
//}

// MARK: - Boardroom
//struct Boardroom: Identifiable, Codable {
//    let id: String
//    let name: String
//    let floorNo: Int
//    let numberOfSeats: Int
//    let description: String
//    let facilities: [String]
//    let imageUrl: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case floorNo = "floor_no"
//        case numberOfSeats = "seat_no"
//        case description
//        case facilities
//        case imageUrl = "image_url"
//    }
//}
struct Boardroom: Identifiable, Codable {
    let id: String
    let name: String
    let floorNo: Int
    let numberOfSeats: Int
    let description: String
    let facilities: [String]
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case floorNo = "floor_no"
        case numberOfSeats = "seat_no"
        case description
        case facilities
        case imageUrl = "image_url"
    }
}
