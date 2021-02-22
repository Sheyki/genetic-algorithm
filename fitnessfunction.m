function out = fitnessfunction(Pi, dStp, dImp, dFrq)
% 5. Napisać funkcję obliczającą wartość funkcji celu / przystosowania na podstawie charakterystyk częstotliwościowych, skokowych i impulsowych.
    agent_ = Pi;
    sys = tf([agent_(1) agent_(2) agent_(3)], [1 agent_(4) agent_(5)]);
    aStp = step(sys, 0:0.1:9.9);
    aImp = impulse(sys, 0:0.1:9.9);
    aFrq = frd(sys, logspace(-2, 2, 100));
    MSE = mean([immse(dStp, aStp)]); % immse(dImp, aImp)]); % immse(dFrq.ResponseData, aFrq.ResponseData)]);
    out = 1/MSE;
end