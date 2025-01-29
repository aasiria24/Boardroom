////
////  EmployeeService.swift
////  Boardroom
////
////  Created by Amaal Asiri on 21/07/1446 AH.
////
//
//
//import Foundation
//
//class EmployeeService {
//    static let shared = EmployeeService()
//    private init() {}
//
//    func fetchEmployees(completion: @escaping (Result<[Employee], Error>) -> Void) {
////        guard let url = URL(string: curl, --location, "https://8cd2971c-9293-4e45-b01c-f3c2c582ad1a.mock.pstmn.io/employees/") else {
//            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
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
//                completion(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
//                return
//            }
//
//            do {
//                let employees = try JSONDecoder().decode([Employee].self, from: data)
//                completion(.success(employees))
//            } catch {
//                completion(.failure(error))
//            }
//        }.resume()
//    }
//}
