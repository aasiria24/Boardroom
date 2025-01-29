//struct Records: Codable {
//    let records: [Record]
//}

// MARK: - Record
//struct Record: Codable {
//    let records: [Record]
//    let id: String
//    let createdTime: String
//    let fields: Employee
//}
struct EmployeeRecordsResponse: Codable {
    let records: [Records]
}

struct Records: Codable {
    let id: String
    let createdTime: String
    let fields: Boardroom
}

// MARK: - Employee
struct Employee: Identifiable, Codable {
    let id: Int
    let jobTitle: String
    let name: String
    let email: String
    let password: String

    enum CodingKeys: String, CodingKey {
        case id
        case jobTitle = "job_title"
        case name
        case email
        case password
    }
}
