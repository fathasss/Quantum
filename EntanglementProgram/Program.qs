namespace EntanglementProgram {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;


    @EntryPoint()
    operation HelloQ() : Unit {
        mutable bothZero = 0;
        mutable bothOne = 0;
        mutable different = 0;

        for x in 1..100 {

            let (r1, r2) = Entanglement();
            
            if (r1 == Zero and r2 == Zero) {
                set bothZero += 1;
            } elif (r1 == One and r2 == One) {
                set bothOne += 1;
            } else {
                set different += 1;
            }
        }

        Message($"100 dolanıklık ölçüm sonucu:");
        Message($"Her ikisi de Zero: {bothZero}");
        Message($"Her ikisi de One:  {bothOne}");
        Message($"Farklı (beklenmedik): {different}");
    }
}

