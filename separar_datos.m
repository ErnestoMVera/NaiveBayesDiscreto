% Datos son los datos que separemos,
% Clases es un vector columna que corresponde a que dato o conjunto de datos (fila)
% corresponde a que clase.
% Proporcion es un vector con dos valores que su suma debe ser 1, que sera
% cuanto porcentaje de entrenamiento y cuanto porcentaje de datos de train
% se generaran.
% Cantidad de clases es la cantidad de clases que existen en el dataset.
function [datos_train, datos_test] = separar_datos(datos, clases, proporcion, cantidad_clases)
% proporcion de entrada.
proporcion = [0.6 0.4];
dataset = trn.xd;
total_filas = numel(dataset(:,1));
% clases
clases = trn.y;
% Porcentaje de datos en cada clase.
proporcion_clase1 = numel(clases(clases==1))/total_filas;
proporcion_clase2 = numel(clases(clases==2))/total_filas;
% Calcular cuantos datos usaremos para training y cuantos para test.
total_datos_training = round(total_filas*proporcion(1));
total_datos_test = round(total_filas*proporcion(2));
% Total de datos que se usaran para el training de la clase 1 y 2
% manteniendo la proporcion.
total_clase1_train = round(total_datos_training*proporcion_clase1);
total_clase2_train = round(total_datos_training*proporcion_clase2);
% Seleccionar datos aleatorios de la clase 1 y 2 para training.
aleatorios = randperm(total_filas, total_filas);
% Mezclar los datos de las clases para seleccionar aleatoriamente.
shuffle = clases(aleatorios);
% Encontrar los indices de la clase 1 en el vector aleatorio.
indices = find(shuffle == 1);
% Construir todos los datos de training de la clase 1.
clase1_training = dataset(indices(1:total_clase1_train),:);
% Eliminar los indices que ya se usaron.
aleatorios(indices(1:total_clase1_train)) = [];
% Hacer la mezcla de nuevo.
shuffle = clases(aleatorios);
% Repetir el proceso para armar los datos.
indices = find(shuffle == 2);
clase2_training = dataset(indices(1:total_clase2_train),:);
aleatorios(indices(1:total_clase2_train)) = [];
% Imprimir la proporcion para ver si se conservo.
p1 = numel(clase1_training(:,1))/total_datos_training
p2 = numel(clase2_training(:,1))/total_datos_training
% Armar el dataset de test.
total_clase1_test = round(total_datos_test*proporcion_clase1);
total_clase2_test = round(total_datos_test*proporcion_clase2);
shuffle = clases(aleatorios);
% Encontrar los indices de la clase 1 en el vector aleatorio.
indices = find(shuffle == 1);
% Construir todos los datos de training de la clase 1.
clase1_test = dataset(indices(1:total_clase1_test),:);
% Eliminar los indices que ya se usaron.
a = numel(aleatorios);
aleatorios(indices(1:total_clase1_test)) = [];
% Hacer la mezcla de nuevo.
shuffle = clases(aleatorios);
% Repetir el proceso para armar los datos.
indices = find(shuffle == 2);
clase2_test = dataset(indices(1:total_clase2_test),:);
aleatorios(indices(1:total_clase2_test)) = [];
ptest1 = numel(clase1_test(:,1))/total_datos_test
ptest2 = numel(clase2_test(:,1))/total_datos_test
end