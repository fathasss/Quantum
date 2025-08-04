namespace BellStateProgram {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;


    @EntryPoint()
    operation HelloQ() : Unit {

        mutable sameResults = 0;
        mutable differentResults = 0;

        for _ in 1..100 {
            let (r1, r2) = BellState();

            if (r1 == r2) {
                set sameResults += 1;
            } else {
                set differentResults += 1;
            }
        }

        Message($"Aynı sonuçlar (|00⟩ veya |11⟩): {sameResults}");
        Message($"Farklı sonuçlar (beklenmeyen): {differentResults}");
    }
}

