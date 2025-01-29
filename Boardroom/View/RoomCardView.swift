import SwiftUI

struct RoomCardView: View {
    let room: Boardroom
    @State private var isRoomDetailPresented = false // Tracks sheet state

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: room.imageUrl)) { image in
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            } placeholder: {
                Color.gray.opacity(0.3)
                    .frame(width: 80, height: 80)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading) {
                Text(room.name)
                    .font(.headline)
                Text("Floor \(room.floorNo)")
                    .font(.subheadline)
                HStack {
                    Text("🪑 \(room.numberOfSeats)")
                    if room.facilities.contains("Wi-Fi") { Text("📶") }
                }
            }

            Spacer()

            // Open RoomDetailView as a fullScreenSheet
            Button(action: {
                isRoomDetailPresented = true
            }) {
                Text("View Details")
                    .font(.caption)
                    .padding(8)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
        .sheet(isPresented: $isRoomDetailPresented) {
            RoomDetailView(room: room, isPresented: $isRoomDetailPresented)
        }
    }
}
