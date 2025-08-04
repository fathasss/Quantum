using System;
using Microsoft.Quantum.Simulation.Simulators;

class Driver
{
    static void Main(string[] args)
    {
        int nQubits = 5;
        int searchIndex = 13; // Örneğin aramak istediğin indeks

        using var sim = new QuantumSimulator();

        var result = FatihSearchAlgorithm.GroverSearch.Run(sim, nQubits, 
            FatihSearchAlgorithm.CalculateOptimalIterations(nQubits), searchIndex).Result;

        Console.WriteLine($"Result measurement: {string.Join(", ", result)}");
    }
}
