# Recognition-of-pHRI-by-Vibration-Analysis

## Data Acquisition
Simulink model `readacc_8bit.slx` is used to receive and save vibration signal with the resolution of 8-bit.
Simulink model `readacc_10bit.slx` is used to receive and save vibration signal with the resolution of 10-bit.

## Database
All the measured datasets are saved in the file `Data_Acquisition.zip`.
The program to compose the database is `test_dataset.m` and `training_dataset.m` in `\Data_Analyse\dataset`.
The finished databases, `training_dataset.mat` and `test_dataset.mat`, are placed in `\Data_Analyse\training`.

## Parameters Estimation
Execute the following files in order, and the specific instructions are written in files.
1. `parameter_aMA.m`
2. `parameter_fMA.m`
3. `parameter_sa.m`
4. `parameter_i.m`

After estimation of the parameters this these four files, generate two new databases as the preparation for the next parameter training. The executed files are `preprocess_loop.m`. Excuting this file with ` preprocess_acceleration;` will genearate the database for the estimation of Ma. And executing this file with `preprocess_frequency;` will genearate the database for the estimation of Mf.

The last step is execute file 'estimation.m'. Executing this file with `estimation_Mutipiler;`to estimate Ma, and excuting this file with `acceleration_and_frequency;`to estimate Mf.

## Simulink Model

Open the model `readacc_final_3.slx`.
You can test this model with saved dataset, when the block 'reading the logged signal' is connected.
You can also test this model with measured data from Arduino, when the blocks 'read signal' and 'calculating acceleration' are connected.
Observe the variation of parameters in block 'Dashboard'.

## Other Functions

`simout_conversion.m` 
Read and plot the raw signal.

`FTT_1.m`
Do fast Fourier transformation and plot the spectrum.

`curve_fitting.m` and `creatFit.m`
Find a sin-function to fit the data, so that the frequency of signal can be read directly from the function.

`estimation_single.m`
Display the result of a single iteration of the training of parameter m (multiplier)

`\Data_Analyse\training\test.m`
 Evaluate the recognition system with the testing dataset.

