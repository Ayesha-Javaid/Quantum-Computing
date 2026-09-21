# Import IBM Quantum primitives
#testing ∣ψ⟩=∣1⟩
from qiskit import QuantumCircuit

# Make state
qc = QuantumCircuit(3, 2)
# 3 qubit and 2 classical bit
qc.h(1)
#putting the first qubit into superposition so we can entangle it

qc.cx(1,2)
#entanglement
# qc.cx(0,1)
# qc.h(0)
qc.x(0)

qc.measure(0, 0)
qc.measure(1, 1)

# Measure state


# Draw circuit
qc.draw("mpl")