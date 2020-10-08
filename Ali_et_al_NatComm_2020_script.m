%For details, refer to Ali et al. (2020). Ketamine disinhibits dendrites 
%and enhances calcium signals in prefrontal dendritic spines. Nature 
%Communications.
%https://doi.org/10.1038/s41467-019-13809-8

%% Fig. 1f
% Note that for some animals, multiple imaging sessions were performed at
% different fields of view

clearvars;
load Fig1f.mat

allRawdFF; %raw dF/F for all cells for all fields of view 
%allRawdFF{fov}{cell,prepost}, where fov is 1...n fields of view; cell is
%1...n number of cells within each fov; prepost is 1 (pre-injection), 2(post-injection)
allCalciumEvents; %peeled calcium events for all cells for all fields of view; same data structure as above
allCalciumEventRate; %mean calcium event rates (Hz) for all cells for all fields of view
%allCalciumEventRate{fov}(cell,prepost) where fov is 1...n fields of view; cell is
%1...n number of cells within each fov; prepost is 1 (pre-injection),
%2(post-injection), 3 ((post-injection minus pre-injection)/pre-injection)*100
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

%% Fig. 1i

clearvars;
load Fig1i.mat

allRawdFF; %raw dF/F for all cells for all fields of view 
allCalciumEvents; %peeled calcium events for all cells for all fields of view
allCalciumEventRate; %mean calcium event rates (Hz) for all cells for all fields of view
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate
%All data structures similar to Fig. 1f

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 250]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

%% Fig. 2b

clearvars;
load Fig2b.mat

allRawdFF; %raw dF/F for all cells for all fields of view
allCalciumEvents; %peeled calcium events for all cells for all fields of view
allCalciumEventRate; %mean calcium event rates (Hz) for all cells for all fields of view
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate
%All data structures similar to Fig. 1f

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 250]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

%% Fig. 2d-e
% Note the amplitude and frequency plots here are slightly different than
% the figures presented in the manuscript. This is because here we binned
% calcium events in 1-second bin, whereas in the manuscript the figures
% were generated using calcium events in 0.28-second bins (i.e. the frame
% rate)

clearvars;
load Fig2d-e.mat

%Dendritic spine data
allRawdFF; %raw dF/F for all spines with dendritic shaft subtraction for all fields of view
%allRawdFF{fov}{spine,prepost}, where fov is 1...n fields of view; spine is
%1...n number of spines within each fov; prepost is 1 (pre-injection), 2(post-injection)
allRawdFFUnsubtracted; %raw dF/F  for all spines without dendritic shaft subtraction
%data structure similar to allRawdFF
allCalciumEvents; %peeled calcium events for all spines for all fields of view; same data structure as above
allCalciumEventRate; %mean calcium event rates (Hz) for all spines for all fields of view
%allCalciumEventRate{fov}(spine,prepost) where fov is 1...n fields of view; spine is
%1...n number of spines within each fov; prepost is 1 (pre-injection),
%2(post-injection), 3 ((post-injection minus pre-injection)/pre-injection)*100
allAmpCalcium; %mean calcium amplitude for all spines for all fields of view; sata data ssructure as allCalciumEventRate
allFreqCalcium;  %mean frequency of calcium events for all spines for all fields of view; same data structure as allCalciumEventRate
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate

%Dendritic shaft data
allRawdFFShaft; %raw dF/F for all dendritic shaft
%data structure similar to above
shaftIdx; %indices mapping assignment of spines to shafts (many spines to one shaft mapping)
% shaftIdx{fov}{spine} where where fov is 1...n fields of view; spine is
% 1...n number of spines; entries in shaftIdx{fov} correspond to the indices in
% allRawdFFShaft{fov}. For example, to get dF/F for spine-shaft pair
% fov=1,spine=5,prepost=1
% spinedFF = allRawdFFUnsubtracted{fov,1}{spine,prepost};
% shaftdFF = allRawdFFShaft{fov,1}{shaftIdx{fov,1}(spine,1),prepost};

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

dataToPlot = cellfun(@(x) x(:,3), allAmpCalcium,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Amplitude');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

dataToPlot = cellfun(@(x) x(:,3), allFreqCalcium,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Frequency');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

%% Fig. 3b-c
% Note the amplitude and frequency plots here are slightly different than
% the figures presented in the manuscript. This is because here we binned
% calcium events in 1-second bin, whereas in the manuscript the figures
% were generated using calcium events in 0.28-second bins (i.e. the frame
% rate)

clearvars;
load Fig3b-c.mat

%Dendritic spine data
allRawdFF; %raw dF/F for all spines with dendritic shaft subtraction for all fields of view
allRawdFFUnsubtracted; %raw dF/F  for all spines without dendritic shaft subtraction
allCalciumEvents; %peeled calcium events for all spines for all fields of view; same data structure as above
allCalciumEventRate; %mean calcium event rates (Hz) for all spines for all fields of view
allAmpCalcium; %mean calcium amplitude for all spines for all fields of view; sata data ssructure as allCalciumEventRate
allFreqCalcium;  %mean frequency of calcium events for all spines for all fields ofAli_ view; same data structure as allCalciumEventRate
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate

%Dendritic shaft data
allRawdFFShaft; %raw dF/F for all dendritic shaft
shaftIdx; %indices mapping assignment of spines to shafts (many spines to one shaft mapping)

%All data structures similar to Fig. 2d-e

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

dataToPlot = cellfun(@(x) x(:,3), allAmpCalcium,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Amplitude');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

dataToPlot = cellfun(@(x) x(:,3), allFreqCalcium,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 200]); 
title ('Frequency');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

%% Fig. 4d

clearvars;
load Fig4d.mat

salPre; %spines x stim levels (1,2,4...64) of calcium responses pre-injection of saline
salPost; %same as above for post-injection of saline
ketPre; %same as above for pre-injection of saline
ketPost; %same as above for post-injection of ketamine

figure;
errorbar([1:1:7],mean(salPre),std(salPre,0,1)./sqrt(size(salPre,1)),'k--'); ylim([0 3.5]); box off;
hold on; errorbar([1:1:7],mean(salPost),std(salPost,0,1)./sqrt(size(salPost,1)),'k'); ylim([0 3.5]); box off;
xticks([1:1:7]);
xticklabels({'1','2','4','8','16','32','64'});
xlabel('Number of pulses');
ylabel('dF/F');

figure; errorbar([1:1:7],mean(ketPre),std(ketPre,0,1)./sqrt(size(ketPre,1)),'r--'); ylim([0 3.5]); box off;
hold on; errorbar([1:1:7],mean(ketPost),std(ketPost,0,1)./sqrt(size(ketPost,1)),'r'); ylim([0 3.5]); box off;
xticks([1:1:7]);
xticklabels({'1','2','4','8','16','32','64'});
xlabel('Number of pulses');
ylabel('dF/F');

%% Fig. 5c

clearvars;
load Fig5c.mat

allRawdFF; %raw dF/F for all cells for all fields of view
allCalciumEvents; %peeled calcium events for all cells for all fields of view
allCalciumEventRate; %mean calcium event rates (Hz) for all cells for all fields of view
frameRate; %imaging frame rate
genotypes; %1=control, no knockdown, 2=knockdown
%All data structures similar to Fig. 1f

dataToPlot = cellfun(@(x) x(:,1), allCalciumEventRate,'UniformOutput',0);
[f,x]=ecdf(cell2mat(dataToPlot(genotypes==1))); %control
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(genotypes==2))); %knockdown
stairs(x,f,'k--'); box off;
xlim([0 4]); 
title ('Calcium events at baseline');
xlabel('Rate (s^-1)');
ylabel('Cumulative fraction');

%% Fig. 5d

clearvars;
load Fig5d.mat

allRawdFF; %raw dF/F for all cells for all fields of view
allCalciumEvents; %peeled calcium events for all cells for all fields of view
allCalciumEventRate; %mean calcium event rates (Hz) for all cells for all fields of view
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate
%All data structures similar to Fig. 1f

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r'); box off;
xlim([-100 250]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above

%% Fig. 5e

clearvars;
load Fig5e.mat

%Dendritic spine data
allRawdFF; %raw dF/F for all spines with dendritic shaft subtraction for all fields of view
allRawdFFUnsubtracted; %raw dF/F  for all spines without dendritic shaft subtraction
allCalciumEvents; %peeled calcium events for all spines for all fields of view; same data structure as above
allCalciumEventRate; %mean calcium event rates (Hz) for all spines for all fields of view
genotypes; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate

%Dendritic shaft data
allRawdFFShaft; %raw dF/F for all dendritic shaft
shaftIdx; %indices mapping assignment of spines to shafts (many spines to one shaft mapping)
%All data structures similar to Fig. 2d

dataToPlot = cellfun(@(x) x(:,1), allCalciumEventRate,'UniformOutput',0);
[f,x]=ecdf(cell2mat(dataToPlot(genotypes==1))); %control
figure;stairs(x,f,'k');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(genotypes==2))); %knockdown
stairs(x,f,'k--'); box off;
xlim([0 4]); 
title ('Calcium events at baseline');
xlabel('Rate (s^-1)');
ylabel('Cumulative fraction');

%% Fig. 5f

clearvars;
load Fig5f.mat

%Dendritic spine data
allRawdFF; %raw dF/F for all spines with dendritic shaft subtraction for all fields of view
allRawdFFUnsubtracted; %raw dF/F  for all spines without dendritic shaft subtraction
allCalciumEvents; %peeled calcium events for all spines for all fields of view; same data structure as above
allCalciumEventRate; %mean calcium event rates (Hz) for all spines for all fields of view
drug; %drug treatment for each fov: 1=saline, 2=ketamine
frameRate; %imaging frame rate

%Dendritic shaft data
allRawdFFShaft; %raw dF/F for all dendritic shaft
shaftIdx; %indices mapping assignment of spines to shafts (many spines to one shaft mapping)
%All data structures similar to Fig. 2d

dataToPlot = cellfun(@(x) x(:,3), allCalciumEventRate,'UniformOutput',0); %take normalized changes in 3rd column
[f,x]=ecdf(cell2mat(dataToPlot(drug==1))); %saline
figure;stairs(x,f,'k--');
hold on;
[f,x]=ecdf(cell2mat(dataToPlot(drug==2))); %ketamine
stairs(x,f,'r--'); box off;
xlim([-100 250]); 
title ('Calcium events');
xlabel('Post-Pre/Pre(%)');
ylabel('Cumulative fraction');
% xline(0); %for Matlab 2018a and above
