////
////  BookingServiceModel.swift
////  Boardroom
////
////  Created by Amaal Asiri on 21/07/1446 AH.
////
//
//import Foundation
//
//class BookingService {
//    private let baseURL = "https://8cd2971c-9293-4e45-b01c-f3c2c582ad1a.mock.pstmn.io/bookings" // Replace with your actual API URL
//
//    // Fetch All Bookings
//    func fetchBookings(completion: @escaping (Result<[Booking], Error>) -> Void) {
//        guard let url = URL(string: baseURL) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 400)))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data received", code: 404)))
//                return
//            }
//            
//            do {
//                let bookings = try JSONDecoder().decode([Booking].self, from: data)
//                completion(.success(bookings))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//
//    // Post New Booking
//    func postBooking(boardroomID: UUID, date: Date, completion: @escaping (Result<BookingResponse, Error>) -> Void) {
//        guard let url = URL(string: baseURL) else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 400)))
//            return
//        }
//        
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        
//        let bookingData: [String: Any] = [
//            "boardroom_id": boardroomID.uuidString,
//            "date": ISO8601DateFormatter().string(from: date)
//        ]
//        
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: bookingData, options: [])
//        } catch {
//            completion(.failure(error))
//            return
//        }
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            guard let data = data else {
//                completion(.failure(NSError(domain: "No data received", code: 404)))
//                return
//            }
//            
//            do {
//                let response = try JSONDecoder().decode(BookingResponse.self, from: data)
//                completion(.success(response))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}
//
