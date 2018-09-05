function swe_ui_main
% Creates a new SWE_UI_MAIN menu.
% =========================================================================
% FORMAT: swe_ui_main
% =========================================================================
% The SwE GUI displays 4 buttons:
%   - Specify model:
%       This option opens the batch window and allows the user to specify a
%       new 'SwE' matlabbatch.
%   - Run model:
%       This option allows the user to run a design specified during the
%       specify model stage.
%   - Results:
%       This option allows the user to view and query thresholded results.
%   - Documentation:
%       This option opens the documentation available on the NISOx website
%       via the Matlab internet browser.
% =========================================================================
% Author: Tom Maullin (05/09/2018)
    
    %=======================================================================
    close(findobj(get(0,'Children'),'Tag','SwE Menu'))

    %-Open SwE menu window
    %----------------------------------------------------------------------
    S = get(0,'ScreenSize');
    F = figure('Color',[0 0.95 1]*.8,...
        'Name','SwE Toolbox',...
        'NumberTitle','off',...
        'Position',[S(3)/2-200,S(4)/2-140,300,290],...
        'Resize','off',...
        'Tag','SwE Menu',...
        'Pointer','Watch',...
        'MenuBar','none',...
        'Visible','off');

    %-Outer Frames and text
    %----------------------------------------------------------------------
    axes('Position',[0 0 80/300 300/300],'Visible','Off')
    text(0.5,0.455,'SwE',...
        'FontName','Times','FontSize',72,...
        'Rotation',90,...
        'VerticalAlignment','middle','HorizontalAlignment','center',...
        'Color',[1 1 1]*.5);
    
    text(0.4,0.96,'Sandwich Estimator Toolbox',...
        'FontName','Times','FontSize',16,'FontAngle','Italic',...
        'FontWeight','Bold',...
        'Color',[1 1 1]*.5);
    
    text(2.5,0.9,['Version ' swe('ver')],...
        'FontName','Times','FontSize',12,'FontAngle','Italic',...
        'FontWeight','Bold',...
        'Color',[1 1 1]*.5);
    
    %-Inner Frames
    %----------------------------------------------------------------------
    uicontrol(F,'Style','Frame','Position',[095 005 200 240],...
              'BackgroundColor',[0.7 0.8 1.0]*.75);
    uicontrol(F,'Style','Frame','Position',[105 015 180 220]);
    
    %-Buttons to launch SwE functions
    %-----------------------------------------------------------------------
    uicontrol(F,'String','Specify Model',...
        'Position',[115 190-(1-1)*55 130 035],...
        'CallBack','swe_design',...
        'Interruptible','on',...
        'ForegroundColor','k');
    
    uicontrol(F,'String','Run Model',...
        'Position',[115 190-(2-1)*55 130 035],...
        'CallBack','swe_compute',...
        'Interruptible','on',...
        'ForegroundColor','k');
    uicontrol(F,'String','?',...
        'Position',[250 190-(2-1)*55 025 035],...
        'CallBack','spm_help(''swe_cp.m'')',...
        'Interruptible','on',...
        'ForegroundColor','b');
    
    uicontrol(F,'String','Results',...
        'Position',[115 190-(3-1)*55 130 035],...
        'CallBack','swe_results_ui;',...
        'Interruptible','on',...
        'ForegroundColor','k');
    uicontrol(F,'String','?',...
        'Position',[250 190-(3-1)*55 025 035],...
        'CallBack','spm_help(''swe_results_ui.m'')',...
        'Interruptible','on',...
        'ForegroundColor','b');
    
    uicontrol(F,'String','<html>Documentation<br>&emsp;&ensp;(Online)',...
        'Position',[115 190-(4-1)*55 130 035],...
        'CallBack','web(''http://www.nisox.org/Software/SwE'')',...
        'Interruptible','on',...
        'ForegroundColor','k');
    
    %-Make visible
    %----------------------------------------------------------------------
    set(F,'Pointer','Arrow','Visible','on');

    
    
end