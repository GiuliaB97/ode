function [fname,pname,var] = load_sav_tab(Path,FileName)

%-------------------------------------------------------------
% MATLAB FUNCTION
% File name: load_sav_tab.m
% Author:    Andrea Ragazzi - Flight Mechanics
% Date:      22-August-2012
% Object:    Function to read Flightlab .sav and .tab files
%            [fname,pname,var]=load_sav_tab;
%-------------------------------------------------------------

if nargin>=2 && ~isempty(Path) && ~isempty(FileName)
    fname=FileName;
    pname=[Path filesep];
else
    [fname,pname]=uigetfile('*.*','Select the file (*.sav,*.tab)');
end

if(fname~=0)
    %get file's extension
    [dummy1,name,ext] = fileparts(fname);
    clear dummy1
    if(strcmp(ext,'.sav'))
    new_str = split (fname,'.');
    topic_name = split(new_str(1),'_');
    
     if(  prod(size(topic_name))> 1 && ( strcmp(topic_name{2}, 'FLME') | strcmp(topic_name{2} , 'TRIM') | strcmp(topic_name{2} , 'ATMO') ...
          | strcmp(topic_name{2}, 'AFCS') | strcmp(topic_name{2} , 'ENG1') | strcmp(topic_name{2} , 'ENG2') ...
          | strcmp(topic_name{2}, 'FADE') | strcmp(topic_name{2} , 'SENS') | strcmp(topic_name{2} , 'STCK'))) %% Normal reading procedure
            %%%% Varlist fromat reading  
        switch string(topic_name(2))
			case "FLME"
                header="TIME,FUEL,XI,YI,ZI,PHI,THETA,PSI,P,Q,R,TILTWING1,FLAPWING1,TILTWING2,FLAPWING2,TILTWING3,FLAPWING3,TILTWING4,FLAPWING4,WOW1,WOW2,WOW3,WOW4,TAS,IAS,GAMH,GAMV,ROC,RADALT,VGRND,VGRNDX,VGRNDY,ALPHA,BETA,AXG1,AYG1,AZG1,NACELLEANGLE1,OMEGA1,TORQUE1,THETA01,A1S1,B1S1,A0F1,A1F1,B1F1,NACELLEANGLE2,OMEGA2,TORQUE2,THETA02,A1S2,B1S2,A0F2,A1F2,B1F2,NACELLEANGLE3,OMEGA3,TORQUE3,THETA03,A1S3,B1S3,A0F3,A1F3,B1F3,NACELLEANGLE4,OMEGA4,TORQUE4,THETA04,A1S4,B1S4,A0F4,A1F4,B1F4,AHRS1AXB,AHRS1AYB,AHRS1AZB,AHRS2AXB,AHRS2AYB,AHRS2AZB,PILAXB,PILAZB,PILAYB,X_LINACC_RESID,Y_LINACC_RESID,Z_LINACC_RESID,X_ANGACC_RESID,Y_ANGACC_RESID,Z_ANGACC_RESID,V_RESID,GAMV_RESID,GAMH_RESID,P_RESID,Q_RESID,R_RESID,PILOTCOND_RESID,POWER_RESID,OMEGA1_RESID,OMEGA2_RESID,OMEGA3_RESID,OMEGA4_RESID,OMEGADOT1_RESID,OMEGADOT2_RESID,OMEGADOT3_RESID,OMEGADOT4_RESID,NACELLE_RESID,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,kg,m,m,m,deg,deg,deg,deg/s,deg/s,deg/s,deg,deg,deg,deg,deg,deg,deg,deg,nd,nd,nd,nd,kts,kts,deg,deg,ft/min,ft,kts,kts,kts,deg,deg,g,g,g,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,g,g,g,g,g,g,g,g,g,m/s^2,m/s^2,m/s^2,rad/s^2,rad/s^2,rad/s^2,m/s,m/s,m/s,rad/s,rad/s,rad/s,rad,HP,rad/s,rad/s,rad/s,rad/s,rad/s^2,rad/s^2,rad/s^2,rad/s^2,deg,nd,nd,nd,nd,nd";
                format="";
            case "TRIM"
                header="HB,FUEL,XI,YI,ZI,PHI,THETA,PSI,P,Q,R,TILTWING1,FLAPWING1,TILTWING2,FLAPWING2,TILTWING3,FLAPWING3,TILTWING4,FLAPWING4,WOW1,WOW2,WOW3,WOW4,TAS,IAS,GAMH,GAMV,ROC,RADALT,VGRND,VGRNDX,VGRNDY,ALPHA,BETA,AXG1,AYG1,AZG1,NACELLEANGLE1,OMEGA1,TORQUE1,THETA01,A1S1,B1S1,A0F1,A1F1,B1F1,NACELLEANGLE2,OMEGA2,TORQUE2,THETA02,A1S2,B1S2,A0F2,A1F2,B1F2,NACELLEANGLE3,OMEGA3,TORQUE3,THETA03,A1S3,B1S3,A0F3,A1F3,B1F3,NACELLEANGLE4,OMEGA4,TORQUE4,THETA04,A1S4,B1S4,A0F4,A1F4,B1F4,AHRS1AXB,AHRS1AYB,AHRS1AZB,AHRS2AXB,AHRS2AYB,AHRS2AZB,PILAXB,PILAZB,PILAYB,X_LINACC_RESID,Y_LINACC_RESID,Z_LINACC_RESID,X_ANGACC_RESID,Y_ANGACC_RESID,Z_ANGACC_RESID,V_RESID,GAMV_RESID,GAMH_RESID,P_RESID,Q_RESID,R_RESID,PILOTCOND_RESID,POWER_RESID,OMEGA1_RESID,OMEGA2_RESID,OMEGA3_RESID,OMEGA4_RESID,OMEGADOT1_RESID,OMEGADOT2_RESID,OMEGADOT3_RESID,OMEGADOT4_RESID,NACELLE_RESID,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5,-,-,-,-,-";
                header1="s,kg,m,m,m,deg,deg,deg,deg/s,deg/s,deg/s,deg,deg,deg,deg,deg,deg,deg,deg,nd,nd,nd,nd,kts,kts,deg,deg,ft/min,ft,kts,kts,kts,deg,deg,g,g,g,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,deg,rad/s,Nm,deg,deg,deg,deg,deg,deg,g,g,g,g,g,g,g,g,g,m/s^2,m/s^2,m/s^2,rad/s^2,rad/s^2,rad/s^2,m/s,m/s,m/s,rad/s,rad/s,rad/s,rad,HP,rad/s,rad/s,rad/s,rad/s,rad/s^2,rad/s^2,rad/s^2,rad/s^2,deg,nd,nd,nd,nd,nd,-,-,-,-,-";
                format="";
            case "ATMO"
                header="TIME,HP,HD,OAT,RHO,PA,HUMIDITY,WINDX,WINDY,WINDZ,SOUND,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,ft,ft,°C,kg/m3,bar,%,kts,kts,kts,m/s,nd,nd,nd,nd,nd";
                format="";
            case "AFCS"
                header="TIME,CLAW_INIT,LON_PA_ACT_CMD,LON_PA_ACT_GRAD,LON_PA_ACT_FRIC,LON_PA_ACT_EN_A,LON_PA_ACT_EN_B,LON_PA_CLUTCH_REL,LAT_PA_ACT_CMD,LAT_PA_ACT_GRAD,LAT_PA_ACT_FRIC,LAT_PA_ACT_EN_A,LAT_PA_ACT_EN_B,LAT_PA_CLUTCH_REL,YAW_PA_ACT_CMD,YAW_PA_ACT_GRAD,YAW_PA_ACT_FRIC,YAW_PA_ACT_EN_A,YAW_PA_ACT_EN_B,YAW_PA_CLUTCH_REL,THR_PA_ACT_CMD,THR_PA_ACT_GRAD,THR_PA_ACT_FRIC,THR_PA_ACT_EN_A,THR_PA_ACT_EN_B,THR_PA_CLUTCH_REL,PWR_PA_ACT_CMD,PWR_PA_ACT_GRAD,PWR_PA_ACT_FRIC,PWR_PA_ACT_EN_A,PWR_PA_ACT_EN_B,PWR_PA_CLUTCH_REL,A_SA_ACT_CMD_1,A_SA_ACT_CMD_2,A_SA_ACT_EN_1,A_SA_ACT_EN_2,B_SA_ACT_CMD_1,B_SA_ACT_CMD_2,B_SA_ACT_EN_1,B_SA_ACT_EN_2,C_SA_ACT_CMD_1,C_SA_ACT_CMD_2,C_SA_ACT_EN_1,C_SA_ACT_EN_2,D_SA_ACT_CMD_1,D_SA_ACT_CMD_2,D_SA_ACT_EN_1,D_SA_ACT_EN_2,TAIL_ACT_1,TAIL_ACT_2,THETA0_ACT_1,THETA0_ACT_2,THETA0_ACT_3,THETA0_ACT_4,B1S_ACT_1,B1S_ACT_2,B1S_ACT_3,B1S_ACT_4,A1S_ACT_1,A1S_ACT_2,A1S_ACT_3,A1S_ACT_4,FLAP_TLTW_ACT_1,FLAP_TLTW_ACT_2,FLAP_TLTW_ACT_3,FLAP_TLTW_ACT_4,TILTW_ACT_1,TILTW_ACT_2,TILTW_ACT_3,TILTW_ACT_4,FLAP_ACT_1,FLAP_ACT_2,FLAP_ACT_3,FLAP_ACT_4,VCON,CAS_LL,CAS_UL,VMINOP,ESTAOA,STALLWARN,RPM_CMD,RPM_ALTCAUT,CONV_ALTWARN,THETA0_LIM_CMD_1,THETA0_LIM_CMD_2,THETA0_LIM_CMD_3,THETA0_LIM_CMD_4,B1S_LIM_CMD_1,B1S_LIM_CMD_2,B1S_LIM_CMD_3,B1S_LIM_CMD_4,ELEV_CMD,RUDD_CMD,FLAP_CMD_1,FLAP_CMD_2,NAC_CMD,NG_CMD,PWR_CMD,FGC_COUPLED,HEIGHT_DATUM_ACQ,HEIGHT_DATUM_VS_ACQ,HEIGHT_PRESEL,HOV_LON_GS_REF,HOV_PRESEL_VS_DATUM,HOV_LAT_GS_REF,HOV_ALONG_HDG_VEL,HOV_CROSS_HDG_VEL,HOV_LAT_ACC_CUE,HOV_LON_ACC_CUE,HDG_PRESEL,HDG_PRESEL_READOUT_ACTIVE,HDG_DATUM,HDG_DATUM_READOUT_ACTIVE,ALTA_REF,ALTA_ACQ_VS_PRESEL,IAS_DATUM,VS_DATUM,ATTR_DATUM,ATTR_DATUM_STEADY,ATTP_DATUM,ATTP_DATUM_STEADY,ALT_DATUM,COLL_MODE_HANDSON,COLL_MODE_TRANSITION,MOT_ENGAGED,MOT_ARMED,GA_MAP_REQUEST,FCC1_to_APCP,FCC2_to_APCP,XLNTA,XLTTA,XPDTA,XCOLA,XLNT,XLTT,XPDT,XCOLT,HFLAPP_ADV,HFLAPP_CAU,XLNTRIM,XLTTRIM,XPDTRIM,XCOLTRIM,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,nd,mm/s,kg/mm,kg,nd,nd,nd,mm/s,kg/mm,kg,nd,nd,nd,mm/s,kg/mm,kg,nd,nd,nd,mm/s,kg/mm,kg,nd,nd,nd,mm/s,kg/mm,kg,nd,nd,nd,mm,mm,nd,nd,mm,mm,nd,nd,mm,mm,nd,nd,mm,mm,nd,nd,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,mm,kts,kts,kts,kts,deg,nd,rad/s,nd,nd,deg,deg,deg,deg,deg,deg,deg,deg,deg,deg,deg,deg,deg,rad/s,N?m,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,mm,mm,mm,mm,mm,mm,mm,mm,nd,nd,mm,mm,mm,mm,nd,nd,nd,nd,nd";
                format="";
            case "ENG1"
                header="TIME,QENG,NG,MGT,TMENG,NP,ITT,PRES,FFLOW,ENGSTATUS,ENGFAIL,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,Nm,rad/s,C°,mm,rad/s,C°,bar,pph,nd,nd,nd,nd,nd,nd,nd";
                format="";
            case "ENG2"
                header="TIME,QENG,NG,MGT,TMENG,NP,ITT,PRES,FFLOW,ENGSTATUS,ENGFAIL,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,Nm,rad/s,C°,mm,rad/s,C°,bar,pph,nd,nd,nd,nd,nd,nd,nd";
                format="";
            case "FADE"
                header="TIME,TMENG_1,TMENG_2,TMENG_3,TMENG_4,FWENG_1,FWENG_2,   FWENG_3,FWENG_4,OEIMODE,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,mm,mm,mm,mm,Kg/sec,Kg/sec,Kg/sec,Kg/sec,nd,nd,nd,nd,nd,nd";
                format="";
            case "SENS"
                header="TIME,HP,HD,OAT,RHO,PA,HUMIDITY,WINDX,WINDY,WINDZ,SOUND,FUEL,XI,YI,ZI,PHI,THETA,PSI,P,Q,R,WOW1,WOW2,WOW3,WOW4,IAS,TAS,TASX,GAMH,GAMV,ROC,RADALT,VGRND,GPS_HDOP,GPS_LAT,GPS_LON,GPS_LAT_FINE,GPS_LON_FINE,GPS_VERT_VEL,GPS_HFOM,VGRNDX,VGRNDY,GPS_HEIGHT,GPS_GMT_HRS,GPS_GMT_MIN,GPS_GMT_SEC,ALPHA,BETA,AXG1,AYG1,AZG1,NACELLEANGLE,OMEGA_AVG,DOWNSTOP,MACH,OMEGA1,A1F1,B1F1,OMEGA2,A1F2,B1F2,POWOFF,QENG_1,NG_1,MGT_1,TMENG_1,NP_1,ITT_1,PRES_1,FFLOW_1,PI_1,PI_PARAM_1,ECL_1,ECL_FLY_1,ECL_OFF_1,ECL_IDLETOFLY_1,INTERSTAGE_BLEED_1,ENGSTATUS_1,ENGFAIL_1,QENG_2,NG_2,MGT_2,TMENG_2,NP_2,ITT_2,PRES_2,FFLOW_2,PI_2,PI_PARAM_2,ECL_2,ECL_FLY_2,ECL_OFF_2,ECL_IDLETOFLY_2,INTERSTAGE_BLEED_2,ENGSTATUS_2,ENGFAIL_2,QENG_3,NG_3,MGT_3,TMENG_3,NP_3,ITT_3,PRES_3,FFLOW_3,PI_3,PI_PARAM_3,ECL_3,ECL_FLY_3,ECL_OFF_3,ECL_IDLETOFLY_3,INTERSTAGE_BLEED_3,ENGSTATUS_3,ENGFAIL_3,QENG_4,NG_4,MGT_4,TMENG_4,NP_4,ITT_4,PRES_4,FFLOW_4,PI_4,PI_PARAM_4,ECL_4,ECL_FLY_4,ECL_OFF_4,ECL_IDLETOFLY_4,INTERSTAGE_BLEED_4,ENGSTATUS_4,ENGFAIL_4,FLAPHND_POS,HYB_HDG,HYB_ALONG_HDG_VEL,HYB_ACROSS_HDG_VEL,HYB_LATITUDE,HYB_LONGITUDE,HYB_LATITUDE_FINE,HYB_LONGITUDE_FINE,SPARE1,SPARE2,SPARE3,SPARE4,SPARE5";
                header1="s,ft,ft,C,kg/m3,bar,%,kts,kts,kts,m/s,kg,m,m,m,deg,deg,deg,deg/s,deg/s,deg/s,nd,nd,nd,nd,kts,kts,kts,deg,deg,ft/min,ft,kts,nd,deg,deg,deg,deg,ft/min,nm,kts,kts,ft,hour,min,s,deg,deg,g,g,g,deg,rad/s,nd,nd,rad/s,deg,deg,rad/s,deg,deg,nd,N?m,rad/s,C,mm,rad/s,C,bar,pph,nd,nd,mm,nd,nd,nd,nd,nd,nd,N?m,rad/s,C,mm,rad/s,C,bar,pph,nd,nd,mm,nd,nd,nd,nd,nd,nd,N?m,rad/s,¡C,mm,rad/s,¡C,bar,pph,nd,nd,mm,nd,nd,nd,nd,nd,nd,N?m,rad/s,C,mm,rad/s,C,bar,pph,nd,nd,mm,nd,nd,nd,nd,nd,nd,deg,deg,kts,kts,deg,deg,deg,deg,nd,nd,nd,nd,nd";
                format="";
            case "STCK"
                header="TIME,PLT_LON,PLT_LAT,PLT_PED,PLT_COL,TRM_LON,TRM_LAT,TRM_PED,TRM_COL,TRM_LON_VEL,TRM_LAT_VEL,TRM_PED_VEL,TRM_COL_VEL,TRM_LON_DIR,TRM_LAT_DIR,TRM_PED_DIR,TRM_COL_DIR,LON_OoD_VAL,LAT_OoD_VAL,PED_OoD_VAL,COL_OoD_VAL,CL_STATUS,CL_CH1_STATUS,CL_CH1_ACT_POS,CL_CH1_ACT_VEL,CL_CH1_MEAS_FORCE,CL_CH1_COMP_FORCE,CL_CH1_TRM_POS,CL_CH1_AFT_POS,CL_CH1_SPARE_VAR1,CL_CH1_SPARE_VAR2,CL_CH1_SPARE_VAR3,CL_CH1_SPARE_VAR4,CL_CH2_STATUS,CL_CH2_ACT_POS,CL_CH2_ACT_VEL,CL_CH2_MEAS_FORCE,CL_CH2_COMP_FORCE,CL_CH2_TRM_POS,CL_CH2_AFT_POS,CL_CH2_SPARE_VAR1,CL_CH2_SPARE_VAR2,CL_CH2_SPARE_VAR3,CL_CH2_SPARE_VAR4,CL_CH3_STATUS,CL_CH3_ACT_POS,CL_CH3_ACT_VEL,CL_CH3_MEAS_FORCE,CL_CH3_COMP_FORCE,CL_CH3_TRM_POS,CL_CH3_AFT_POS,CL_CH3_SPARE_VAR1,CL_CH3_SPARE_VAR2,CL_CH3_SPARE_VAR3,CL_CH3_SPARE_VAR4,CL_CH4_STATUS,CL_CH4_ACT_POS,CL_CH4_ACT_VEL,CL_CH4_MEAS_FORCE,CL_CH4_COMP_FORCE,CL_CH4_TRM_POS,CL_CH4_AFT_POS,CL_CH4_SPARE_VAR1,CL_CH4_SPARE_VAR2,CL_CH4_SPARE_VAR3,CL_CH4_SPARE_VAR4";
                header1="s,mm,mm,mm,mm,mm,mm,mm,mm,mm/s,mm/s,mm/s,mm/s,nd,nd,nd,nd,nd,nd,nd,nd,nd,nd,mm,mm/s,N,N,mm,mm,nd,nd,nd,nd,nd,mm,mm/s,N,N,mm,mm,nd,nd,nd,nd,nd,mm,mm/s,N,N,mm,mm,nd,nd,nd,nd,nd,mm,mm/s,N,N,mm,mm,nd,nd,nd,nd";
                format="";
        end
          %open file
        fid=fopen(strcat(pname,fname),'r');
        cont = 1;
        %load data
        line=fgetl(fid);
        while (~feof(fid))
            if(line(1)~='#')
                variable=[];
                [name_var,rem]=strtok(line);
              
                dimensions=str2num(rem);
                row=dimensions(1);
                col=dimensions(2);
                im =dimensions(3);
                %get units
                position=ftell(fid);
                line=fgetl(fid);
                if(line(1)=='#')
                    [dummy units]=strtok(line);
                else
                    units='';
                    fseek(fid,position,'bof');
                end
                if im == 0
                    for i=1:1:floor(row*col/3)+1
                        line=fgetl(fid);
                        variable=[variable str2num(line)];
                    end
                    variablereshaped=reshape(variable,row,col);
                    header=strsplit(header, ",");
                    header1=strsplit(header1, ",");
                    for i=1:1:col
                        var(i)=struct('name',{header(i)},'val',{variablereshaped(:,i)},'units',{header1(i)});
                    end
                 else
                     for i=1:1:floor(row*col/3)+1
                         line=fgetl(fid);
                         variable=[variable str2num(line)];
                     end
                     variablereshaped=reshape(variable,row,col);
                     header=strsplit(header, ",");
                     header1=strsplit(header1, ",");
                     for i=1:1:col
                        var(i)=struct('name',{strcat('re',header(i))},'val',{variablereshaped(:,i)},'units',{header1(i)});
                     end
                     for i=1:1:floor(row*col/3)+1
                         line=fgetl(fid);
                         variable=[variable str2num(line)];
                     end
                     for i=1:1:col
                        var(i)=struct('name',{strcat('imag',header(i))},'val',{variablereshaped(:,i)},'units',{header1(i)});
                     end
                end
                
            end
            
            line=fgetl(fid);
        end 
     else
         %open file
        fid=fopen(strcat(pname,fname),'r');
        cont = 1;
        %load data
        line=fgetl(fid);
        while (~feof(fid))
            if(line(1)~='#')
                variable=[];
                [name_var,rem]=strtok(line);
              
                dimensions=str2num(rem);
                row=dimensions(1);
                col=dimensions(2);
                im =dimensions(3);
                %get units
                position=ftell(fid);
                line=fgetl(fid);
                if(line(1)=='#')
                    [dummy units]=strtok(line);
                else
                    units='';
                    fseek(fid,position,'bof');
                end
                if im == 0
                    for i=1:1:floor(row*col/3)+1
                        line=fgetl(fid);
                        variable=[variable str2num(line)];
                    end
                    var(cont)=struct('name',{lower(name_var)},'val',{reshape(variable,row,col)},'units',{units});
                    cont = cont + 1;
                else
                    for i=1:1:floor(row*col/3)+1
                        line=fgetl(fid);
                        variable=[variable str2num(line)];
                    end
                    var(cont)=struct('name',{strcat('re',lower(name_var))},'val',{reshape(variable,row,col)},'units',{units});
                    cont = cont + 1;
                    variable=[];
                    for i=1:1:floor(row*col/3)+1
                        line=fgetl(fid);
                        variable=[variable str2num(line)];
                    end
                    var(cont)=struct('name',{strcat('imag',lower(name_var))},'val',{reshape(variable,row,col)},'units',{units});
                    cont = cont + 1;
                end
                
            end
            
            line=fgetl(fid);
        end

    end
        %close file
        fclose(fid);
    elseif(strcmp(ext,'.tab'))
        %open file
        fid=fopen(strcat(pname,fname),'r');
        
        %skip comments
        line=fgetl(fid);
        while(line(1)=='#')
            line=fgetl(fid);
        end
        
        %get the names of the variables
        [dummy1,names]=strtok(line);
        clear dummy1
        
        %get data
        line=fgetl(fid);
        cont = 1;
        while(line(1)~='#')
            data(cont,:)=str2num(line);
            line=fgetl(fid);
            cont=cont+1;
        end
        
        for i=1:1:size(data,2)
            [name_var names]=strtok(names);
            var(i)=struct('name',{lower(name_var)},'val',{data(:,i)},'units',{''});
        end
        
        %close file
        fclose(fid);
    else
        disp('Not supported file. Please select another file.');
        var=0;
    end
else
    var=0;
end
