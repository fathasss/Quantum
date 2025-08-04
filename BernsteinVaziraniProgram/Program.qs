namespace BernsteinVaziraniFixed {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation RunBV() : Result[] {
        use input = Qubit[4];
        use target = Qubit(); // target qubit (başlangıçta |0⟩)

        // target qubit'i |1⟩ yapmak için X uygula
        X(target);

        // Hadamard'ları uygula
        ApplyToEach(H, input);
        H(target);

        // Oracle: s = 1101 → 0,1,2,3 => s = [1,1,0,1]
        CNOT(input[0], target);
        CNOT(input[1], target);
        // input[2] için hiçbir şey yapılmaz
        CNOT(input[3], target);

        // Tekrar Hadamard
        ApplyToEach(H, input);

        // Ölçüm
        mutable results = [Zero, Zero, Zero, Zero];

        for i in 0..3 {
            set results w/= i <- MResetZ(input[i]);
        }

        Reset(target);
        return results;
    }
}
