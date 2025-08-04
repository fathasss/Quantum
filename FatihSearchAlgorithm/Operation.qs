namespace FatihSearchAlgorithm {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;


    operation ReflectAboutMarked(indexToSearch : Int, inputQubits : Qubit[]) : Unit {
        Message($"Reflecting about marked state for index {indexToSearch}...");
        use outputQubit = Qubit();

        let nQubits = Length(inputQubits);
        let bits = IntAsBoolArray(indexToSearch, nQubits);

        within {
            X(outputQubit);
            H(outputQubit);

            for idx in 0..nQubits - 1 {
                if (not bits[idx]) {
                    X(inputQubits[idx]);
                }
            }
        } apply {
            Controlled X(inputQubits, outputQubit);
        }

        Reset(outputQubit);
    }

    operation PrepareUniform(inputQubits : Qubit[]) : Unit is Adj + Ctl {
        for q in inputQubits {
            H(q);
        }
    }

    operation ReflectAboutAllOnes(inputQubits : Qubit[]) : Unit {
        Controlled Z(Most(inputQubits), Tail(inputQubits));
    }

    operation ReflectAboutUniform(inputQubits : Qubit[]) : Unit {
        within {
            Adjoint PrepareUniform(inputQubits);
            for q in inputQubits {
                X(q);
            }
        } apply {
            ReflectAboutAllOnes(inputQubits);
        }
    }

    function CalculateOptimalIterations(nQubits : Int) : Int {
        if nQubits > 63 {
            fail "Supports max 63 qubits.";
        }
        let nItems = 1 <<< nQubits; // 2^nQubits
        let angle = ArcSin(1.0 / Sqrt(IntAsDouble(nItems)));
        let iterations = Round(0.25 * PI() / angle - 0.5);
        return iterations;
    }

    operation GroverSearch(
        nQubits : Int,
        iterations : Int,
        indexToSearch : Int
    ) : Result[] {

        use qubits = Qubit[nQubits];

        PrepareUniform(qubits);

        for _ in 1..iterations {
            ReflectAboutMarked(indexToSearch, qubits);
            ReflectAboutUniform(qubits);
        }

        return MResetEachZ(qubits);
    }

    @EntryPoint()
    operation Main() : Result[] {
        let nQubits = 5; // Veri kümesinin büyüklüğüne göre arttırabilirsin
        let iterations = CalculateOptimalIterations(nQubits);

        // Burayı default bırakıyoruz, C# driver'dan index alacağız.
        let indexToSearch = 0;

        Message($"Number of iterations: {iterations}");
        Message($"Searching for index: {indexToSearch}");

        let results = GroverSearch(nQubits, iterations, indexToSearch);
        return results;
    }
}
