////
////  EmployeeViewModel.swift
////  Boardroom
////
////  Created by Amaal Asiri on 21/07/1446 AH.
////
//
////import SwiftUI
////
////@Observable
////class EmployeeViewModel {
////    var employees: [Employee] = []
////    var isLoading = false
////    var errorMessage: String?
////
////    func loadEmployees() {
////        isLoading = true
////        errorMessage = nil
//
////        EmployeeService.shared.fetchEmployees { result in
////            DispatchQueue.main.async {
////                self.isLoading = false
////                switch result {
////                case .success(let employees):
////                    self.employees = employees
////                case .failure(let error):
////                    self.errorMessage = error.localizedDescription
////                }
////            }
////        }
////    }
////}

import Foundation

class EmployeeViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    func fetchEmployees() {
        isLoading = true
        errorMessage = nil

        guard let url = URL(string: "https://8cd2971c-9293-4e45-b01c-f3c2c582ad1a.mock.pstmn.io/employees/") else {
            self.errorMessage = "Invalid URL"
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                guard let data = data else {
                    self.errorMessage = "No data received"
                    return
                }
                do {
                    self.employees = try JSONDecoder().decode([Employee].self, from: data)
                } catch {
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
}
