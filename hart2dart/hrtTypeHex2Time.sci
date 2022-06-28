function strTime=hrtTypeHex2Time(strHex)//'XX XX XX XX' -> 0.03125
    auxVet = hex2dec(tokens(strHex,' '));
    valor = auxVet(1)*524288+auxVet(2)*2048+auxVet(3)*8+auxVet(4)*0.03125;
    miliseg = modulo(valor,1000);
    seg  = modulo(int(valor/1000),60);
    minu = modulo(int(valor/60000),60);
    hora = int(valor/3600000);
    strTime = msprintf("%02d:%02d:%02d:%03d",hora,minu,seg,miliseg);
endfunction

