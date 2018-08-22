% Radiation7= ['Chromium']
% Radiation6= ['Bronze']
% Radiation5= ['Steel']
% eval('Radiation7')

S.Name = {'Aluminum';'Brass';'Copper';'Steel';'Iron';'Zinc';'Chromium';'Nickel';'Tin'};
S.Stress = [Stress(1,1);Stress(1,2);Stress(1,3);Stress(1,4);Stress(1,5);Stress(1,6);Stress(1,7);Stress(1,8);Stress(1,9)];
S.Strain = [Strain(1,1);Strain(1,2);Strain(1,3);Strain(1,4);Strain(1,5);Strain(1,6);Strain(1,7);Strain(1,8);Strain(1,9)];
S.Deformation = [Deformation(1,1);Deformation(1,2);Deformation(1,3);Deformation(1,4);Deformation(1,5);Deformation(1,6);Deformation(1,7);Deformation(1,8);Deformation(1,9)];

S

T = struct2table(S)

T.Properties.RowNames = T.Name;
T.Name = [];

T