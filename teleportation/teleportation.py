from qiskit import QuantumCircuit

# Make state
qc = QuantumCircuit(3)
qc.h(1)
qc.h(2)
qc.cx(0, 1, 2)



# Measure state
qc.measure_all()

# Draw circuit
qc.draw("mpl")