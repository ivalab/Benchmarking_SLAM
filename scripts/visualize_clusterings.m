clc;
clear;

addpath('ThirdParty/subplot_tight');
load test_results.mat
% preprocess to eliminate an invalid sequence result
a([4:13:65],:)=[];a=a(:);
r(4:13:65,:)=[];r=r(:);
t(4:13:65,:)=[];t=t(:);
%% train
ids = 1:numel(a);
data=[ids',t,a,r];
data(isnan(sum(data(:,2:end),2)),:)=[];
% [indices, c] = kmeans(data(:,2:end), 4);
%
% plot3(data(:,2),data(:,3),data(:,4),'bo');
% plot3(c(:,1),c(:,2),c(:,3),'r*');

% flags = nan(numel(a)/5, 5);
% flags(data(:,1)) = indices;

r(find(r>2))=2;
r(find(isnan(r)))=2;
r=r/2;

% [indices,c]=kmeans([t, r],3)
% plot(t, r,'o');
% plot(t(indices==1), r(indices==1),'go','markersize',12);
% plot(t(indices==3), r(indices==3),'bo','markersize',12);
% plot(t(indices==4), r(indices==4),'ro','markersize',12);
% plot(t(indices==2), r(indices==2),'ko','markersize',12);

%% visualize according to test results
subplot_mv = 0.1;
subplot_mh = 0.1;
fs = 18;
difficulty_colors = {'g','b','r'};
algorithm_shapes = {'o', 's', '*', '^', 'd'};

figure
%%
subplot_tight(2,2,1,[subplot_mv,subplot_mh]);
hold on, grid on, box on, axis equal
plot([999,999],[999,999],'ko','markersize',20, 'linewidth',2);
plot([999,999],[999,999],'ks','markersize',20, 'linewidth',2);
plot([999,999],[999,999],'k*','markersize',20, 'linewidth',2);
plot([999,999],[999,999],'k^','markersize',20, 'linewidth',2);
plot([999,999],[999,999],'kd','markersize',20, 'linewidth',2);
xlabel('Tracking Loss (%)');
ylabel('Normalized RPE');
title('Aggregate Easy/Medium/Difficult Sequences');
xlim([-0.02,1]);
ylim([-0.02,1]);
for i=1:300
        m = [difficulty_colors{pdt(i)+2}, algorithm_shapes{alg(i)}];
        if ~(t(i)==1 && r(i)==1)
        plot(t(i), r(i),m,'markersize',20, 'linewidth',2);
        end
end
plot([0.22, 0.22], [0,1], 'k--');
plot([0.81, 0.81], [0,1], 'k--');
plot([0, 1], [0.44,0.44], 'k--');
legend('DSO', 'SVO', 'ORB', 'GF', 'MH');
% % plot(t(indices==5), r(indices==5),'ro','markersize',12);
% % plot(t(indices==6), r(indices==6),'mo','markersize',12);
% % plot(t(indices==4), r(indices==4),'ro','markersize',12);
% % plot(t(indices==5), r(indices==5),'co');
% plot(c(:,1),c(:,2),'r*','markersize',16);
set(gca,'fontname','Times New Roman','fontsize',fs);
xticks(0:0.2:1);
yticks(0:0.2:1);
%%
subplot_tight(2,2,2,[subplot_mv,subplot_mh]);
hold on, grid on, box on, axis equal
xlabel('Tracking Loss (%)');
ylabel('Normalized RPE');
title('Easy Sequences');
xlim([0,1]);
ylim([0,1]);
for i=1:300
        m = [difficulty_colors{pdt(i)+2}, algorithm_shapes{alg(i)}];
        if pdt(i)==-1
            if ~(t(i)==1 && r(i)==1)
            plot(t(i), r(i),m,'markersize',20, 'linewidth',2);
            end
        end
end
plot([0.22, 0.22], [0,1], 'k--');
plot([0.81, 0.81], [0,1], 'k--');
plot([0, 1], [0.44,0.44], 'k--');
set(gca,'fontname','Times New Roman','fontsize',fs);
xticks(0:0.2:1);
yticks(0:0.2:1);
%%
subplot_tight(2,2,3,[subplot_mv,subplot_mh]);
hold on, grid on, box on, axis equal
xlabel('Tracking Loss (%)');
ylabel('Normalized RPE');
title('Medium Sequences');
xlim([0,1]);
ylim([0,1]);
for i=1:300
        m = [difficulty_colors{pdt(i)+2}, algorithm_shapes{alg(i)}];
        if pdt(i)==0
            if ~(t(i)==1 && r(i)==1)
            plot(t(i), r(i),m,'markersize',20, 'linewidth',2);
            end
        end
end
plot([0.22, 0.22], [0,1], 'k--');
plot([0.81, 0.81], [0,1], 'k--');
plot([0, 1], [0.44,0.44], 'k--');
set(gca,'fontname','Times New Roman','fontsize',fs);
xticks(0:0.2:1);
yticks(0:0.2:1);
%%
subplot_tight(2,2,4,[subplot_mv,subplot_mh]);
hold on, grid on, box on, axis equal
xlabel('Tracking Loss (%)');
ylabel('Normalized RPE');
title('Difficult Sequences');
xlim([0,1]);
ylim([0,1]);
for i=1:300
        m = [difficulty_colors{pdt(i)+2}, algorithm_shapes{alg(i)}];
        if pdt(i)==1
            if ~(t(i)==1 && r(i)==1)
            plot(t(i), r(i),m,'markersize',20, 'linewidth',2);
            end
        end
end
plot([0.22, 0.22], [0,1], 'k--');
plot([0.81, 0.81], [0,1], 'k--');
plot([0, 1], [0.44,0.44], 'k--');
set(gca,'fontname','Times New Roman','fontsize',fs);
xticks(0:0.2:1);
yticks(0:0.2:1);
