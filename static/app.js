document.addEventListener("DOMContentLoaded", function() {
    const seatsDiv = document.getElementById("seats");
    const reserveButton = document.getElementById("reserveButton");
    const seatCountInput = document.getElementById("seatCount");

    // Function to load the current seat status
    function loadSeats() {
        fetch('/status')
            .then(response => response.json())
            .then(seats => {
                seatsDiv.innerHTML = ''; // Clear previous seats
                seats.forEach(seat => {
                    const seatBox = document.createElement('div');
                    seatBox.className = seat.status === 'available' ? 'seat available' : 'seat reserved';
                    seatBox.innerText = `Seat ${seat.seat_id} (${seat.status})`;
                    seatsDiv.appendChild(seatBox);
                });
            });
    }

    // Load seats on page load
    loadSeats();

    // Handle reserve button click
    reserveButton.addEventListener("click", function() {
        const seatCount = parseInt(seatCountInput.value);
        if (isNaN(seatCount) || seatCount < 1) {
            alert("Please enter a valid number of seats.");
            return;
        }

        fetch('/reserve', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ seats: seatCount })
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert(data.error);
            } else {
                alert(`Reserved seats: ${data.reserved_seats.join(", ")}`);
                loadSeats(); // Refresh seat status
            }
        });
    });
});
