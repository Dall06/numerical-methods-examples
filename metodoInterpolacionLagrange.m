function polinomio = metodoInterpolacionLagrange(arrDatos)
    syms x;
    Px = 1;
    polinomio = 0;
    
    for i = 1 : size(arrDatos, 2)
        Px = Px * (x - arrDatos(1, i));
    end
    
    terminos = children(Px);
    for i = 1 : size(arrDatos, 2)
        polinomios(i) = Px / terminos(i);
    end
    
    for i = 1 : size(arrDatos, 2)
        polinomio = polinomio + (arrDatos(2, i) * (polinomios(i) / subs(polinomios(i), arrDatos(1, i))));
    end
end