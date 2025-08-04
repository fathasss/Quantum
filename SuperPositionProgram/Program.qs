namespace SuperPositionProgram {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;


    @EntryPoint()
    operation HelloQ() : Unit {
        mutable zeroCount = 0;
        mutable oneCount = 0;

        for x in 1..100 {

            let result = SuperPosition();

            if (result == Zero) {
                set zeroCount += 1;
            } else {
                set oneCount += 1;
            }
        }

        Message($"100 ölçüm sonucu:");
        Message($"Zero: {zeroCount}");
        Message($"One: {oneCount}");
    }
}

