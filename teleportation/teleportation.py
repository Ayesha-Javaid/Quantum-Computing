# Import IBM Quantum primitives
from qiskit import QuantumCircuit

# Make state
qc = QuantumCircuit(3, 2)
# 3 qubit and 2 classical bit
qc.h(1)
#putting the first qubit into superposition so we can entangle it
qc.cx(1,2)
#entanglement
qc.cx(0,1)
qc.h(0)
# Measure state
qc.measure(0, 0)
qc.measure(1, 1)




# Draw circuit
qc.draw("mpl")