function Dijkstra(Pesos, nodos, fuente, fuente2)
    flag = size(nodos + 1);
    minpos = 1;
    Distancia = size(100);
    for i = 1:nodos
        flag(i) = 0;
        Distancia(i) = Pesos(fuente,i);
    end
    c = 2;
    while c <= nodos
        min = 99;
        for k = 1:nodos
            if Distancia(k) < min && flag(k) ~= 1
              min = Distancia(i);
              minpos = k;
            end
        end
        flag(minpos) = 1;
        c = c + 1;
        for k = 1:nodos
            if Distancia(minpos) + Pesos(minpos, k) < Distancia(k) && flag(k)~=1
                   Distancia(k) = Distancia(minpos) + Peso(minpos, k);
            end
        end
    end
    for i=1:nodos
        if(i ~= fuente && fuente2 == i) 
            fprintf("La distancia de %i a %i es de: %i\n", fuente, fuente2, Distancia);
        end
    end
end