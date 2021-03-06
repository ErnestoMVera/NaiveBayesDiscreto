% Datos son los datos que separemos,
% Clases es un vector columna que corresponde a que dato o conjunto de datos (fila)
% corresponde a que clase.
% Proporcion es un vector con dos valores que su suma debe ser 1, que sera
% cuanto porcentaje de entrenamiento y cuanto porcentaje de datos de train
% se generaran.
% Cantidad de clases es la cantidad de clases que existen en el datos.
function [datos_train, datos_test, datos_train_clase, datos_test_clase] = separar_datos(datos, clases, proporcion, total_clases)
    [total_filas,total_columnas] = size(datos);
    % Porcentaje de datos en cada clase.
    proporcion_clases = zeros(total_clases,1);
    for i = 1:total_clases
       proporcion_clases(i) = numel(clases(clases==i))/total_filas; 
    end
    % Calcular cuantos datos usaremos para training y cuantos para test.
    total_datos_training = round(total_filas*proporcion(1));
    total_datos_test = round(total_filas*proporcion(2));
    % Total de datos que se usaran para el training de la clase i
    % manteniendo la proporcion.
    total_datos_clases_train = zeros(total_clases, 1);
    for i = 1:total_clases
        total_datos_clases_train(i) = round(total_datos_training*proporcion_clases(i));
    end
    % Seleccionar datos aleatorios de las clases para training.
    aleatorios = randperm(total_filas, total_filas);
    % Mezclar los datos de las clases para seleccionar aleatoriamente.
    shuffle = clases(aleatorios);
    shuffleDataset = datos(aleatorios,:);
    % Datos
    datos_train = zeros(total_datos_training, total_columnas);
    % Clases.
    datos_train_clase = zeros(total_datos_training, 1);
    indiceAnterior = 1;
    for i = 1:total_clases
        % Encontrar los indices de la clase i en el vector aleatorio.
        indices = find(shuffle == i);
        % Construir todos los datos de training con la clase i.
        indiceFinal = indiceAnterior+total_datos_clases_train(i) - 1;
        datos_train(indiceAnterior:indiceFinal,:) = shuffleDataset(indices(1:total_datos_clases_train(i)),:);
        datos_train_clase(indiceAnterior:indiceFinal) = i;
        indiceAnterior = indiceFinal+1;
        % Eliminar los indices que ya se usaron.
        aleatorios(indices(1:total_datos_clases_train(i))) = [];
        % Hacer la mezcla de nuevo.
        shuffle = clases(aleatorios);
        shuffleDataset = datos(aleatorios,:);
    end
    % manteniendo la proporcion.
    % Armar la cantidad de datos manteniendose las proporciones de test.
    total_datos_clases_test = zeros(total_clases, 1);
    for i = 1:total_clases
        total_datos_clases_test(i) = round(total_datos_test*proporcion_clases(i));
    end
    shuffle = clases(aleatorios);
    % Datos
    datos_test = zeros(total_datos_test, total_columnas);
    % Clases.
    datos_test_clase = zeros(total_datos_test, 1);
    indiceAnterior = 1;
    for i = 1:total_clases
        % Encontrar los indices de la clase i en el vector aleatorio.
        indices = find(shuffle == i);
        % Construir todos los datos de training con la clase i.
        indiceFinal = indiceAnterior+total_datos_clases_test(i) - 1;
        datos_test(indiceAnterior:indiceFinal,:) = shuffleDataset(indices(1:total_datos_clases_test(i)),:);
        datos_test_clase(indiceAnterior:indiceFinal) = i;
        indiceAnterior = indiceFinal+1;
        % Eliminar los indices que ya se usaron.
        aleatorios(indices(1:total_datos_clases_test(i))) = [];
        % Hacer la mezcla de nuevo.
        shuffle = clases(aleatorios);
        shuffleDataset = datos(aleatorios,:);
    end
end