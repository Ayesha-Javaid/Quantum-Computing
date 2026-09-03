# --- Build the Bell circuit (phi-minus) ---
bell = QuantumCircuit(2)
bell.h(0)
bell.z(0)
bell.cx(0, 1)
bell.measure_all()  # creates a classical register named "meas"

bell.draw("mpl")