load('datos_wdbc.mat')
[train,test,trainy,testy] = separar_datos(trn.xd,trn.y,[0.6 0.4],2);
corrector_laplaciano = 0.0001;
inferidas = zeros(numel(testy),1);
for i = 1:numel(testy)
    inferidas(i) = clasificadorNaiveBayes(test(i,:), train, trainy, 2, corrector_laplaciano);
end
fprintf("Porcentaje de reconocimiento 60%%-40%%: %.2f\n",sum(testy == inferidas)/numel(testy));
[train,test,trainy,testy] = separar_datos(trn.xd,trn.y,[0.7 0.3],2);
inferidas = zeros(numel(testy),1);
for i = 1:numel(testy)
    inferidas(i) = clasificadorNaiveBayes(test(i,:), train, trainy, 2, corrector_laplaciano);
end
fprintf("Porcentaje de reconocimiento 70%%-30%%: %.2f\n",sum(testy == inferidas)/numel(testy));
[train,test,trainy,testy] = separar_datos(trn.xd,trn.y,[0.8 0.2],2);
inferidas = zeros(numel(testy),1);
for i = 1:numel(testy)
    inferidas(i) = clasificadorNaiveBayes(test(i,:), train, trainy, 2, corrector_laplaciano);
end
fprintf("Porcentaje de reconocimiento 80%%-20%%: %.2f\n",sum(testy == inferidas)/numel(testy));
[train,test,trainy,testy] = separar_datos(trn.xd,trn.y,[0.9 0.1],2);
inferidas = zeros(numel(testy),1);
for i = 1:numel(testy)
    inferidas(i) = clasificadorNaiveBayes(test(i,:), train, trainy, 2, corrector_laplaciano);
end
fprintf("Porcentaje de reconocimiento 90%%-10%%: %.2f\n",sum(testy == inferidas)/numel(testy));