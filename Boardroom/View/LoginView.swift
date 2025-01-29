import SwiftUI

struct LoginView: View {
    @State private var jobNumber: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var loginError: String? = nil
    @State private var isLoggedIn: Bool = false // Tracks login state

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Image
                Image("LoginBackground") // Replace with the actual asset name
                    .resizable()
//                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)

                VStack(spacing: 20) {
                    // Welcome Text
                    Text("Welcome back! Glad to see you, Again!")
                        .font(.title)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.orange)
                        .padding(.bottom, 20)

                    // Job Number TextField
                    TextField("Enter your job number", text: $jobNumber)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 1)
                        .keyboardType(.numberPad)

                    // Password TextField with Toggle
                    HStack {
                        if isPasswordVisible {
                            TextField("Enter your password", text: $password)
                        } else {
                            SecureField("Enter your password", text: $password)
                        }

                        // Toggle Password Visibility
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 1)

                    // Login Button
                    Button(action: {
                        handleLogin()
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding(.top, 10)

                    // Error Message
                    if let error = loginError {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.footnote)
                            .padding(.top, 5)
                    }
                }
                .padding(.horizontal, 30)
                // Navigation Destination
                .navigationDestination(isPresented: $isLoggedIn) {
                    BoardroomMainView() // Navigate to Boardrooms View
                }
            }
        }
    }

    // Handle Login Action
    private func handleLogin() {
        if jobNumber.isEmpty || password.isEmpty {
            loginError = "Please fill in all fields."
        } else if jobNumber == "112233" && password == "password123" { // Example validation
            loginError = nil
            isLoggedIn = true // Navigate to Boardrooms View
        } else {
            loginError = "Invalid job number or password."
        }
    }
}

// Dummy BoardroomMainView for Navigation
struct boardroomMainView: View {
    var body: some View {
        Text("Welcome to the Boardrooms!")
        
    }
}
//    @StateObject private var bookingViewModel = BookingViewModel()
//    @StateObject private var boardroomViewModel = BoardroomViewModel()
//    @State private var selectedDate = Date() // Tracks the selected date for the calendar
//
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading, spacing: 20) {
//                    // Title
//                    Text("Board Rooms")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding(.horizontal)
//
//                    // Clickable Banner
//                    NavigationLink(destination: AvailableRoomsView()) {
//                        Image("AvailableToday") // Replace with actual asset name
//                            .resizable()
//                            .scaledToFit()
//                            .frame(height: 150)
//                            .cornerRadius(12)
//                            .padding(.horizontal)
//                    }
//
//                    // My Booking Section
//                    if !bookingViewModel.bookings.isEmpty {
//                        Text("My Booking")
//                            .font(.headline)
//                            .padding(.horizontal)
//
//                        ScrollView(.horizontal, showsIndicators: false) {
//                            HStack {
//                                ForEach(bookingViewModel.bookings) { booking in
//                                    if let boardroom = boardroomViewModel.boardrooms.first(where: { $0.id == booking.boardroomID }) {
//                                        BookingCardView(booking: booking, boardroom: boardroom)
//                                    } else {
//                                        Text("Boardroom not found")
//                                            .foregroundColor(.red)
//                                            .padding()
//                                            .background(Color.white)
//                                            .cornerRadius(12)
//                                            .shadow(radius: 2)
//                                    }
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
//
//                    // Custom Calendar
//                    CalendarView(selectedDate: $selectedDate)
//                        .padding(.horizontal)
//
//                    // All Rooms for the Month
//                    Text("All bookings for March")
//                        .font(.headline)
//                        .padding(.horizontal)
//
//                    VStack(spacing: 10) {
//                        ForEach(boardroomViewModel.boardrooms) { room in
//                            RoomCardView(room: room)
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//                .padding(.top)
//                .onAppear {
//                    // Fetch data when the view appears
//                    bookingViewModel.fetchBookings()
//                    boardroomViewModel.fetchBoardrooms()
//                }
//            }
//        }
//    }
//}


// Preview
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
