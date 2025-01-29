
import SwiftUI
// Updated Booking Card (for My Booking section)
struct BookingCardView: View {
    let booking: Booking
    let boardroom: Boardroom
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: boardroom.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 60, height: 60)
            .cornerRadius(8)
            
            //            VStack(alignment: .leading) {
            VStack {
                Text(boardroom.name)
                    .font(.headline)
                Text("Floor \(boardroom.floorNo)")
                    .font(.subheadline)
                Text(Date(timeIntervalSince1970: booking.date), style: .date) // Converts date to readable format
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
    }
}
//
//// Placeholder Views for Navigation
struct AvailableRoomsView: View {
    var body: some View {
        Text("Available Rooms View")
    }
}


struct CalendarView: View {
    @Binding var selectedDate: Date
    let bookings: [Booking]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Weekday Labels
            HStack {
                ForEach(["Thu", "Sun", "Mon", "Tue", "Wed", "Thu", "Sun", "Mon", "Tue"], id: \.self) { day in
                    Text(day)
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(width: 40, alignment: .center)
                }
            }
            .padding(.horizontal)
            
            // Scrollable Days
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(16...28, id: \.self) { day in
                        VStack {
                            Text("\(day)")
                                .font(.subheadline)
                                .frame(width: 40, height: 40)
                                .background(Circle().fill(day == Calendar.current.component(.day, from: selectedDate) ? Color.orange : Color.clear))
                                .foregroundColor(day == Calendar.current.component(.day, from: selectedDate) ? .white : .black)
                                .overlay(Circle().stroke(Color.gray.opacity(0.5), lineWidth: 1))
                                .onTapGesture {
                                    selectedDate = Calendar.current.date(bySetting: .day, value: day, of: selectedDate) ?? selectedDate
                                }
                            
                            // Show booking status (Available/Unavailable)
                            if hasBooking(on: day) {
                                Text("Unavailable")
                                    .font(.caption2)
                                    .foregroundColor(.red)
                            } else {
                                Text("Available")
                                    .font(.caption2)
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .frame(height: 100)
    }
    
    // Helper function to check if a booking exists for a specific day
    private func hasBooking(on day: Int) -> Bool {
        let calendar = Calendar.current
        let date = calendar.date(bySetting: .day, value: day, of: selectedDate) ?? selectedDate
        return bookings.contains { booking in
            calendar.isDate(Date(timeIntervalSince1970: booking.date), inSameDayAs: date)
        }
    }
}

struct BoardroomMainView: View {
    @StateObject private var bookingViewModel = BookingViewModel()
    @StateObject private var boardroomViewModel = BoardroomViewModel()
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // Title
                    Text("Board Rooms")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                    
                    // Clickable Banner
                    NavigationLink(destination: AvailableRoomsView()) {
                        Image("AvailableToday") // Replace with actual asset name
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    
                    // My Booking Section
                    if !bookingViewModel.bookings.isEmpty {
                        Text("My Booking")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(bookingViewModel.bookings) { booking in
                                    if let boardroom = boardroomViewModel.boardrooms.first(where: { $0.id == booking.boardroomID }) {
                                        BookingCardView(booking: booking, boardroom: boardroom)
                                    } else {
                                        Text("Boardroom not found")
                                            .foregroundColor(.red)
                                            .padding()
                                            .background(Color.white)
                                            .cornerRadius(12)
                                            .shadow(radius: 2)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    // Custom Calendar
                    //                    CalendarView(selectedDate: $selectedDate)
                    //                        .padding(.horizontal)
                    // Custom Calendar
                    CalendarView(selectedDate: $selectedDate, bookings: bookingViewModel.bookings)
                        .padding(.horizontal)
                        .frame(height: 80) // Ensure it has enough space
                        .background(Color.white) // Debugging to check visibility
//                        .border(Color.red) // Debugging to check visibility
                    
                    // All Rooms for the Month
                    Text("All bookings for March")
                        .font(.headline)
                        .padding(.horizontal)
                        .padding(.bottom, 150)
                    
                    VStack {
                        ForEach(boardroomViewModel.boardrooms) { room in
                            RoomCardView(room: room)
                        }
                    }
                    .padding()
                    .frame(width: 390 , height: 100)
                    //                    .padding(.leading ,50)
                    .padding(.horizontal)
                }
                .padding(.top)
                .onAppear {
                    // Fetch data when the view appears
                    bookingViewModel.fetchBookings()
                    boardroomViewModel.fetchBoardrooms()
                }
            }
        }
    }
}



struct BoardroomMainView_Previews: PreviewProvider {
    static var previews: some View {
        BoardroomMainView()
            .environmentObject(BookingViewModel(mockData: true))
    }
}
