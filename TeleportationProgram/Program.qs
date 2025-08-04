namespace TeleportationProgram {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation HelloQ() : Unit {
        Message("Teleportasyon başlıyor...");

        mutable bothZero = 0;
        mutable bothOne = 0;

        for _ in 1..100 {

            let result = Teleport();
            if (result == One) {
                set bothOne += 1;
            } else {
                set bothZero += 1;
            }
        }

        Message($"Sonuçlar (100 tekrar):");
        Message($"  Zero: {bothZero}");
        Message($"  One : {bothOne}");
    }
}

