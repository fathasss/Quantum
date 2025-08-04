namespace QFTAlgorithmProgram {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Diagnostics;
    open Microsoft.Quantum.Measurement;

    @EntryPoint()
    operation HelloQ() : Result[] {
        use qs = Qubit[3];
        mutable resultArray = [Zero, Zero, Zero];

        // QFT Uygulaması:
        // 1. Qubit (qs[0])
        H(qs[0]);
        Controlled R1([qs[1]], (PI() / 2.0, qs[0]));
        Controlled R1([qs[2]], (PI() / 4.0, qs[0]));

        // 2. Qubit (qs[1])
        H(qs[1]);
        Controlled R1([qs[2]], (PI() / 2.0, qs[1]));

        // 3. Qubit (qs[2])
        H(qs[2]);

        // Sonuçları Little Endian yerine Big Endian yapacak şekilde tersleme:
        SWAP(qs[0], qs[2]);

        Message("Before measurement:");
        DumpMachine();

        for i in 0..2 {
            set resultArray w/= i <- M(qs[i]);
        }

        Message("After measurement:");
        DumpMachine();

        ResetAll(qs);
        Message("Post-QFT measurement results [qubit0, qubit1, qubit2]:");
        return resultArray;
    }
}
