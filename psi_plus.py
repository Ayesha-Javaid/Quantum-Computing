# Import IBM Quantum primitives
from qiskit import QuantumCircuit

# Make state
qc = QuantumCircuit(2)
qc.x(0)
qc.h(0)
qc.cx(0, 1)



# Measure state
qc.measure_all()

# Draw circuit
qc.draw("mpl")