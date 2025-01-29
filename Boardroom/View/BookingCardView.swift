//
//  BookingCardView.swift
//  Boardroom
//
//  Created by Amaal Asiri on 27/07/1446 AH.
//

import SwiftUI

struct bookingCardView: View {
    let booking: Booking
    @StateObject private var boardroomViewModel = BoardroomViewModel()

    var body: some View {
        if let boardroom = boardroomViewModel.boardrooms.first(where: { $0.id == booking.boardroomID }) {
            HStack {
                AsyncImage(url: URL(string: boardroom.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 60, height: 60)
                .cornerRadius(8)

                VStack(alignment: .leading) {
                    Text(boardroom.name)
                        .font(.headline)
                    Text("Floor \(boardroom.floorNo)")
                        .font(.subheadline)
                    Text(Date(timeIntervalSince1970: booking.date), style: .date)
                        .font(.caption)
                }

                Spacer()

                Text("Details")
                    .font(.caption)
                    .padding(8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(radius: 2)
        } else {
            Text("Boardroom not found")
                .foregroundColor(.red)
        }
    }
}
