Improved gravity-geologic method reliably removing the long-wavelength gravity effect of regional seafloor topography
This is my share of IGGM technology. Limited by their own capabilities, there are still many places to improve. 
If you have any suggestions and comments, don't hesitate to contact me andechao1@126.com
Thank you!

information about code:

1. IGGM_one.m file: The corrected long-wave gravity anomaly is calculated.
2. grid.bat file: Using  Generic Mapping Tools (GMT) to deal with long-wave gravity anomalies. The latitude and longitude ranges need to be modified according to the study area
3. IGGM_two.m file: Determine the optimal value of each parameter.
4. IGGM_model.m file: The optimal values are used to calculate the final sounding model. 
5. BLH2XYZ.m and GetGrid.m files are functions that need to be called within the program.
6. Data folder is test data, and the range of test data is 113°E-119°E, 12°N-19°N.

codes was build with Matlab version 2022a, and we as tested and run.

Notice: Gross errors detection and elimination of shipborned bathymetry data were performed before IGGM calculation.
