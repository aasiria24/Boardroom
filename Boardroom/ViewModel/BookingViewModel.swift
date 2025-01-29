import Foundation

class BookingViewModel: ObservableObject {
    @Published var bookings: [Booking] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    private let apiURL = URL(string: "https://api.airtable.com/v0/appElKqRPusTLsnNe/bookings")!
    private let apiKey = "Bearer pat7E88yW3dgzlY61.2b7d03863aca9f1262dcb772f7728bd157e695799b43c7392d5faf4f52fcb001"
    
    // Default initializer (for real data)
    init() {}

    // Mock initializer for Previews
    init(mockData: Bool) {
        if mockData {
            self.bookings = [
                Booking(
                    id: "1",
                    employeeID: 101010,
                    boardroomID: "12345",
                    date: Date().timeIntervalSince1970 // Convert Date to TimeInterval
                ),
                Booking(
                    id: "2",
                    employeeID: 112233,
                    boardroomID: "67890",
                    date: Date().addingTimeInterval(86400).timeIntervalSince1970 // +1 day
                ),
                Booking(
                    id: "3",
                    employeeID: 445566,
                    boardroomID: "54321",
                    date: Date().addingTimeInterval(2 * 86400).timeIntervalSince1970 // +2 days
                )
            ]
        }
    }
    // Fetch bookings from API
    func fetchBookings() {
        isLoading = true
        errorMessage = nil
        
        var request = URLRequest(url: apiURL)
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
                    self?.errorMessage = "No data received"
                    return
                }
                do {
                    // Decode response using generic RecordsResponse
                    let recordsResponse = try JSONDecoder().decode(recordsResponse<Booking>.self, from: data)
                    self?.bookings = recordsResponse.records.map { $0.fields }
                } catch {
                    self?.errorMessage = "Failed to decode data: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
