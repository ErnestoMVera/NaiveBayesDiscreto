function probabilidades = entrenamientoNaiveBayes(datos, clases, total_clases)
    %ENTRENAMIENTONAIVEBAYES Entrenamiento para el modelo inteligente Naive
    %Bayes.
    pr_apriori = zeros(total_clases,1);
    for i = 1:total_clases
        pr_apriori(i) = numel(clases(clases == i))/numel(clases);
    end
    % Densidad de probabilidad.
    for i = 1:total_clases
        
    end
end

