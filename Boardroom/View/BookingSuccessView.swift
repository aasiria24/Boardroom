import SwiftUI

struct BookingSuccessView: View {
    let roomName: String
    let bookingDate: Date
    var onDismiss: () -> Void // Callback to dismiss RoomDetailView
    
    var body: some View {
        VStack(spacing: 40) {
            ZStack {
                Image("LoginBackground")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Image("Confirmation")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    Text("Booking Success!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.black)

                    VStack(spacing: 8) {
                        Text("Your booking for \(roomName)")
                            .font(.body)
                            .multilineTextAlignment(.center)
                        Text("on \(formattedDate(bookingDate)) is confirmed.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(12)
                }
            }

            Spacer()

            Button(action: {
                onDismiss() // Call dismiss function
            }) {
                Text("Done")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(8)
            }
            .padding()
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter.string(from: date)
    }
}

// Preview
struct BookingSuccessView_Previews: PreviewProvider {
    static var previews: some View {
        BookingSuccessView(roomName: "Ideation Room", bookingDate: Date(), onDismiss: {})
    }
}
