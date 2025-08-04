namespace StringTheoryMBrane {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;


    operation Similation() : Result[] {
        use qubits = Qubit[11];
        mutable results = [Zero, Zero, Zero, Zero, Zero, Zero, Zero, Zero, Zero, Zero, Zero];

        //Superpozisyon ve dolanıklık
        H(qubits[0]);

        for i in 1..3 {
            CNOT(qubits[i-1], qubits[i]);
        }

        //Faz dönüşümleri
        Rz(0.25 * PI(), qubits[4]);
        Rz(0.5 * PI(), qubits[5]);
        Rz(0.75 * PI(), qubits[6]);
        Rz(PI(), qubits[7]);

        //Superpozisyonlar
        H(qubits[8]);
        H(qubits[9]);
        H(qubits[10]);

        for i in 0..10 {
            set results w/= i <- M(qubits[i]);
        }

        ResetAll(qubits);
        return results;
    }
}

