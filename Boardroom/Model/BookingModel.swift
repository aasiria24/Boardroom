//import Foundation
//
//struct Booking: Identifiable, Codable {
//    let id: String
//    let employeeID: Int
//    let boardroomID: String
//    let date: String
//    enum CodingKeys: String, CodingKey {
//        case id
//        case employeeID = "employee_id"
//        case boardroomID = "boardroom_id"
//        case date
//    }
//}
import Foundation

struct Booking: Identifiable, Codable {
    let id: String
    let employeeID: Int
    let boardroomID: String// Ensure this matches the response from your API
    let date: TimeInterval

    enum CodingKeys: String, CodingKey {
        case id
        case employeeID = "employee_id"
        case boardroomID = "boardroom_id"
        case date
    }
}
