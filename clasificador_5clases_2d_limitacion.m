clc % Limpia pantalla
clear all % Limpia todo 
close all % Cierra cualquier proceso
warning off all

% Clasificador en 2 dimensiones, programa que calcula la toma de decisiones
% entre 2 clases dado un vector desconocido

% Introducimos los datos de mis clases:

c1 = [1,3,1,2,3 ; 2,3,5,2,3];
c2 = [6,6,7,8,8 ; 4,3,4,4,5];
c3 = [-4,-5,-3,-6,-4 ; 3,2,2,4,4];
c4 = [-2,-4,-4,-2,-4 ; -6,-6,-4,-4,-8];
c5 = [4,6,4,5,4 ; -2,-4,-6,-3,-4];

% Declaramos nuestro vector
vx = input('Proporciona las coordenadas del vector en x =')
vy = input('Proporciona las coordenadas del vector en y =')
vector = [vx ; vy];
% vector = [5 ; 4];

% Graficando las clases
plot(c1(1,:),c1(2,:),'ro','MarkerSize',10,'MarkerFaceColor','r') % Definimos la gráfica para clase 1
grid on % Agregamos reticula
hold on % Respeta todo lo que vaya a graficar despues del 1er plot
plot(c2(1,:),c2(2,:),'bo','MarkerSize',10,'MarkerFaceColor','b') % Graficamos la clase 2
plot(c3(1,:),c3(2,:),'yo','MarkerSize',10,'MarkerFaceColor','y') % Graficamos la clase 3
plot(c4(1,:),c4(2,:),'go','MarkerSize',10,'MarkerFaceColor','g') % Graficamos la clase 4
plot(c5(1,:),c5(2,:),'co','MarkerSize',10,'MarkerFaceColor','c') % Graficamos la clase 5
plot(vector(1,:),vector(2,:),'ko','MarkerSize',10,'MarkerFaceColor','k') % Graficamos el vector
legend('Clase 1','Clase 2','Clase 3','Clase 4','Clase 5','Vector') % Muestra el nombre de cada clase

% Calculando los parámetros por cada clase
media1 = mean(c1,2); % mean devuelve la media
media2 = mean(c2,2); % media para la clase 2
media3 = mean(c3,2); % media para la clase 3
media4 = mean(c4,2); % media para la clase 4
media5 = mean(c5,2); % media para la clase 5

% Obteniendo las distancias entre el vector a clasificar y la media i.e
% centro de gravedad
dist1 = norm(media1-vector); % norm es equivalente a la distancia euclidiana
dist2 = norm(media2-vector); % distancia del vector a la media de la clase 2
dist3 = norm(media3-vector); % distancia del vector a la media de la clase 3
dist4 = norm(media4-vector); % distancia del vector a la media de la clase 4
dist5 = norm(media5-vector); % distancia del vector a la media de la clase 4

% Comparando las distancias
dato = [dist1,dist2,dist3,dist4,dist5]
minimo = min(dato) % min devuelve el menor valor en una matriz
dato2 = find(dato == minimo) % find devuelve el valor posicional de un dato

% Finalmente mostramos la clase a la cual pertenece el vector
% Añadimos el limite
if  minimo >= 10 % Si la distancia menor a la clase cn es mayor a 10, no consideramos al vector como elemento de la clase
    fprintf('El vector desconocido no pertenece a ninguna de las clases\n')
else
    fprintf('El vector desconocido pertenece a la clase %d\n',dato2) % Caso contrario se considera
end
disp('Fin de programa')