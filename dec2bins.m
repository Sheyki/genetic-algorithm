function n_ = dec2bins(n, L)
    n_ = "0b"+dec2bin(n*100, L)+"s"+string(L);
end