function scatterplot_single_subj(data,subjtag,colo,position)
% scatterplot single data with its median and 95%CI

% data should be 2D (conditions, subjs)
% FEI YI - University of Glasgow - March 2 2016

if nargin < 3
    colo = gray(size(data,1)+1);
end

if isempty(position)
    position = [ 0.1300    0.7093    0.2    0.2157];
end

alpha=0.05;nboot=1000;est='hd';
condis = size(data,1); 
subjsize = size(data,2);

%%
% group
ylimmin = - 0.01; %- (max(data(:)) - min(data(:)))*.1
axes('Position',position);hold on
for c=1:condis
    [~,EST,CI(c,:),~] = pbCI(data(c,:),nboot,alpha,est);
    plot([c c],CI(c,:),'color','k','LineWidth',1.5);hold on   
    scatter(c,EST,50,'MarkerEdgeColor','k','MarkerFaceColor',colo(c,:));
end
ylimCImax = max(CI(:))*1.1;
plot([condis+1 condis+1],[ylimmin ylimCImax],'k--','LineWidth',1);hold on
set(gca,'YLim',[ylimmin ylimCImax],'yaxislocation','left', ...
    'ygrid','on','yminorgrid','on','YMinorTick','on', ...
    'xlim',[0 condis+1],'XTick',[], ...
    'FontName','utopia','fontsize',11,'LineWidth',1,'Layer','Top')

% each subject
ylimmax = max(data(:)) + abs(max(data(:)))*.1;
possubj = get(gca,'position');
possubj(1) = possubj(1) + possubj(3).*1.2; possubj(3) = possubj(3) + .6;
axes('Position',possubj);hold on

for c=1:condis
    for S=1:subjsize        
        tmp = data(c,S);
        scatter(S,tmp,'MarkerEdgeColor',colo(c,:),'LineWidth',2);hold on;
    end
end
plot([0 0],[ylimmin ylimmax],'k--','LineWidth',1);hold on
set(gca,'YLim',[ylimmin ylimmax],'yaxislocation','right', ...
    'ygrid','on','yminorgrid','on','YMinorTick','on', ...
    'xlim',[0 subjsize+1],'XTick',[1:subjsize],'XTickLabel',[subjtag], ...
    'FontName','utopia','fontsize',11,'LineWidth',1,'Layer','Top');

set(gcf,'renderer','painter');
set(gcf,'InvertHardCopy','off')

