import SwiftUI

struct RoomDetailView: View {
    let room: Boardroom
    @Binding var isPresented: Bool // Allows dismissing RoomDetailView
    @State private var isBookingSuccessful = false

    var body: some View {
        NavigationStack {
            VStack {
                // Room Image
                AsyncImage(url: URL(string: room.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .cornerRadius(12)
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .padding(.horizontal)
                
                // Room Name and Floor Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(room.name)
                        .font(.title)
                        .bold()
                    
                    HStack {
                        Image(systemName: "location.fill")
                        Text("Floor \(room.floorNo)")
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack(spacing: 16) {
                        Text("🪑 \(room.numberOfSeats)")
                        ForEach(room.facilities, id: \.self) { facility in
                            if facility == "Wi-Fi" {
                                Text("📶")
                            } else if facility == "Screen" {
                                Text("🖥️")
                            }
                        }
                    }
                    .font(.caption)
                    .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                // Description Section
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline)
                    Text(room.description)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
                // Facilities Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("Facilities")
                        .font(.headline)
                    HStack(spacing: 16) {
                        ForEach(room.facilities, id: \.self) { facility in
                            if facility == "Wi-Fi" {
                                Label("Wi-Fi", systemImage: "wifi")
                            } else if facility == "Screen" {
                                Label("Screen", systemImage: "desktopcomputer")
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                // Custom Calendar Placeholder
                VStack(alignment: .leading, spacing: 8) {
                    Text("All bookings for March")
                        .font(.headline)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(16...28, id: \.self) { day in
                                Text("\(day)")
                                    .frame(width: 40, height: 40)
                                    .background(day == 16 ? Color.orange.opacity(0.8) : Color.clear)
                                    .cornerRadius(20)
                                    .overlay(
                                        Circle()
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    )
                            }
                        }
                    }
                }
                .padding(.horizontal)
                
                // Booking Button
                Button(action: {
                    isBookingSuccessful = true
                }) {
                    Text("Booking")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationDestination(isPresented: $isBookingSuccessful) {
                BookingSuccessView(roomName: room.name, bookingDate: Date()) {
                    isPresented = false // Dismiss RoomDetailView when success is confirmed
                }
            }
            .padding()
            .navigationTitle(room.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

// Preview
struct RoomDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RoomDetailView(
            room: Boardroom(
                id: "12345",
                name: "Ideation Room",
                floorNo: 3,
                numberOfSeats: 16,
                description: "This is a sample description of the room.",
                facilities: ["Wi-Fi", "Screen"],
                imageUrl: "https://via.placeholder.com/200"
            ),
            isPresented: .constant(true) // Test dismissing
        )
    }
}
