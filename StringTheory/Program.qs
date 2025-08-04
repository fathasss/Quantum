namespace StringTheory {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;

    @EntryPoint()
    operation HelloQ() : Unit {
        Message("Hello quantum world!");
    }

    operation Similation() : Result[] {
        use qubits = Qubit[3];

        // Qubit 0 süperpozisyon
        H(qubits[0]);

        // Qubit 0 ve 1 arasında dolanıklık
        CNOT(qubits[0], qubits[1]);

        // Qubit 2 üzerine faz dönüşü (Z ekseni etrafında π = 180 derece)
        Rz(PI(), qubits[2]);

        // Ölçüm
        mutable results = [Zero,Zero,Zero];
        for i in 0..2 {
            set results w/= i <- M(qubits[i]);
        }

        // Qubit'leri sıfırla (simülasyon etiği!)
        ResetAll(qubits);

        return results;
    }
}

