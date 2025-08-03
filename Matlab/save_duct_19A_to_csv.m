
function save_duct_19A_to_csv(D, filename)
    % Absolute length of the duct
    L = D/2; 
    
    % Normalized coordinates from the table
    x_L = [0, 0.0125, 0.025, 0.050, 0.075, 0.100, 0.150, 0.200, 0.25, 0.30, 0.40, 0.50, 0.60, 0.70, 0.80, 0.90, 0.95, 1.00]; 
    yi_L = [0.1825, 0.1466, 0.1280, 0.1087, 0.0800, 0.0634, 0.0387, 0.0217, 0.0110, 0.0048, 0, 0, 0, 0, 0.0029, 0.0082, 0.0145, 0.0236]; 
    yu_L = [NaN, 0.2072, 0.2107, 0.2080, 0.203989, 0.199978, 0.191956, 0.183933, 0.175911, 0.167889, 0.151844, 0.1358, 0.119756, 0.103711, 0.087667, 0.071622, 0.0636,NaN]; 

    % Ensure all vectors have the same length
    if length(x_L) ~= length(yi_L) || length(x_L) ~= length(yu_L)
        error('Vectors x_L, yi_L, and yu_L must have the same length!');
    end

    % Compute radii
    R_prop = D / 2; % Propeller radius
    clearance = 0.02 * D; % Clearance between propeller and duct (assumed to be 2% of diameter)
    
    % Calculate absolute coordinates
    x = x_L * L; 
    yi = (yi_L * D) + R_prop + clearance;
    yu = (yu_L * D) + R_prop; % Upper part of the duct

    % Create a table of the coordinates
    duct_data = table(x', yi', yu', 'VariableNames', {'x', 'yi', 'yu'});
    
    % Save the file as CSV
    writetable(duct_data, filename);
    
    disp(['Data saved to ', filename]);
end

