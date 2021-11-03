function clase = clasificadorNaiveBayes(dato_test, datos_entrenamiento, clases, total_clases, corrector_laplaciano)
    pr_apriori = zeros(total_clases,1);
    for i = 1:total_clases
        pr_apriori(i) = numel(clases(clases == i))/numel(clases);
    end
    % Densidad para el datoTest dado.
    pr_densidad = zeros(total_clases,1);
    for i = 1:total_clases
        ci = datos_entrenamiento(clases == i,:);
        dens = sum((ci./dato_test) == 1)/(numel(clases(clases==i)));
        dens(dens == 0) = corrector_laplaciano;
        pr_densidad(i) = prod(dens);
    end
    pr_c = pr_densidad.*pr_apriori;
    clase = find(pr_c == max(pr_c));
end