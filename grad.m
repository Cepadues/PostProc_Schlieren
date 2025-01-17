function vitesse=grad(rayon, temps, k)
    % k correspond à la largeur de calcul du gradient 
    l = length(rayon); % Longueur du vecteur rayon
    vitesse = zeros(length(rayon),1); % Prealocation du vecteur vitesse
    dt = temps(2) - temps(1); % Interval de temps entre deux rayons successifs 
    
    for i = 1:k
        vitesse(i) = (rayon(i+k) - rayon(i))/(k*dt); % Calcul de la vitesse au point i avec un schéma décentré
    end
    for i = 1+k:l-k
        vitesse(i) = (rayon(i+k) - rayon(i-k))/(2*k*dt); % Calcul de la vitesse au point i avec un schéma centré de largeur k
    end
    for i = l-k+1:l
        vitesse(i) = (rayon(i) - rayon(i-k))/(k*dt); % Calcul de la vitesse au point i avec un schéma décentré
    end

    
end