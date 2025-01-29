import Foundation
//
//class BoardroomViewModel: ObservableObject {
//    @Published var boardrooms: [Boardroom] = []
//    @Published var isLoading = false
//    @Published var errorMessage: String?
//
//    private let url = URL(string: "https://api.airtable.com/v0/appElKqRPusTLsnNe/boardrooms")!
//        private let apiKey = "pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001" // Replace with your actual API key
//
//        // Fetch Boardrooms
//        func fetchBoardrooms() {
//            isLoading = true
//            errorMessage = nil
//
//            var request = URLRequest(url: url)
//            request.httpMethod = "GET"
//            request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
//
//            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//                DispatchQueue.main.async {
//                    self?.isLoading = false
//                    if let error = error {
//                        self?.errorMessage = error.localizedDescription
//                        return
//                    }
//
//                    guard let data = data else {
//                        self?.errorMessage = "No data received."
//                        return
//                    }
//
//                    do {
//                        // Decode using generic RecordsResponse
//                        let recordsResponse = try JSONDecoder().decode(RecordsResponse.self, from: data)
////                        self?.boardrooms = recordsResponse.records.map { $0.fields }
//                        print(data)
//                    } catch {
//                        self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
//                    }
//                }
//            }.resume()
//        }
//    }
class BoardroomViewModel: ObservableObject {
    @Published var boardrooms: [Boardroom] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let url = URL(string: "https://api.airtable.com/v0/appElKqRPusTLsnNe/boardrooms")!
    private let apiKey = "pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001" // Replace with your actual API key

    func fetchBoardrooms() {
        isLoading = true
        errorMessage = nil

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                if let error = error {
                    self?.errorMessage = error.localizedDescription
                    return
                }

                guard let data = data else {
                    self?.errorMessage = "No data received."
                    return
                }

                do {
                    let recordsResponse = try JSONDecoder().decode(RecordsResponse.self, from: data)
                    self?.boardrooms = recordsResponse.records.map { $0.fields }
                } catch {
                    self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
//    // MARK: - Records Response
//    struct RecordsResponse: Codable {
//        let records: [Record]
//    }
//
//    struct records: Codable {
//        let fields: Boardroom
//    }
