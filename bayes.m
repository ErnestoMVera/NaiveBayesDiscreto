load('datos_wdbc.mat')
datos = trn.xd;
[train,test,trainy,testy] = separar_datos(trn.xd,trn.y,[0.6 0.4],2);
%train = [1 1 1;1 1 1;1 1 1;2 1 1;2 1 2;2 2 2;2 2 2;2 2 1;1 2 2;1 1 2];
%trainy = [1 2 1 2 1 2 1 2 2 1];
%test = [1 2 1];
%c = clasificadorNaiveBayes(test, train,trainy,2)
inferidas = zeros(numel(testy),1);
for i = 1:numel(testy)
    inferidas(i) = clasificadorNaiveBayes(test(i,:), train,trainy,2);
end
sum(testy == inferidas)/numel(testy)