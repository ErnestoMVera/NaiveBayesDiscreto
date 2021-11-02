load('datos_wdbc.mat')
datos = trn.xd;
[train,test,trainy,testy] = separar_datos(trn.xd,trn.y,[0.6 0.4],2);
numel(testy(testy == 1))/numel(testy)
numel(testy(testy == 2))/numel(testy)