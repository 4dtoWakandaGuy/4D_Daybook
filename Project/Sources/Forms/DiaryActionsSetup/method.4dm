If (False:C215)
	//Project Form Method Name: DiaryActionsSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_ActionMod;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude1;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude2;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude3;0)
	//ARRAY BOOLEAN(SD2_at_ActionInclude4;0)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_LocationRowFound; DB_bo_NoLoad; SD2_bo_SettingsMod)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_Index2; $_l_LocationOffset; $_l_LocationRow; SD2_LBUT1; SD2_LBUT10; SD2_LBUT11; SD2_LBUT12; SD2_LBUT13; SD2_LBUT14)
	C_LONGINT:C283(SD2_LBUT15; SD2_LBUT16; SD2_LBUT17; SD2_LBUT18; SD2_LBUT19; SD2_LBUT2; SD2_LBUT20; SD2_LBUT21; SD2_LBUT22; SD2_LBUT23; SD2_LBUT24)
	C_LONGINT:C283(SD2_LBUT25; SD2_LBUT26; SD2_LBUT27; SD2_LBUT3; SD2_LBUT4; SD2_LBUT5; SD2_LBUT6; SD2_LBUT7; SD2_LBUT8; SD2_LBUT9)
	C_POINTER:C301($_ptr_2tr)
	C_TEXT:C284($_t_oldMethodName; oSD2_ACT1; oSD2_ACT10; oSD2_ACT11; oSD2_ACT12; oSD2_ACT13; oSD2_ACT14; oSD2_ACT15; oSD2_ACT16; oSD2_ACT17; oSD2_ACT18)
	C_TEXT:C284(oSD2_ACT19; oSD2_ACT2; oSD2_ACT20; oSD2_ACT21; oSD2_ACT22; oSD2_ACT23; oSD2_ACT24; oSD2_ACT25; oSD2_ACT26; oSD2_ACT27; oSD2_ACT3)
	C_TEXT:C284(oSD2_ACT4; oSD2_ACT5; oSD2_ACT6; oSD2_ACT7; oSD2_ACT8; oSD2_ACT9; oSd2_HED1; oSd2_HED10; oSd2_HED11; oSd2_HED12; oSd2_HED13)
	C_TEXT:C284(oSd2_HED14; oSd2_HED15; oSd2_HED16; oSd2_HED17; oSd2_HED18; oSd2_HED19; oSd2_HED2; oSd2_HED20; oSd2_HED21; oSd2_HED22; oSd2_HED23)
	C_TEXT:C284(oSd2_HED24; oSd2_HED25; oSd2_HED26; oSd2_HED27; oSd2_HED3; oSd2_HED4; oSd2_HED5; oSd2_HED6; oSd2_HED7; oSd2_HED8; oSd2_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM DiaryActionsSetup"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		SD2_bo_SettingsMod:=False:C215
		ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
		ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
		SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
		If (Records in selection:C76([ACTIONS:13])=0)
			ALL RECORDS:C47([ACTIONS:13])
		End if 
		
		ARRAY TEXT:C222(SD2_at_ActionCodes; 0)
		ARRAY TEXT:C222(SD2_at_ActionNames; 0)
		ARRAY BOOLEAN:C223(SD2_at_ActionInclude1; 0)
		ARRAY BOOLEAN:C223(SD2_at_ActionInclude2; 0)
		ARRAY BOOLEAN:C223(SD2_at_ActionInclude3; 0)
		ARRAY BOOLEAN:C223(SD2_at_ActionInclude4; 0)
		
		For ($_l_Index; 1; Records in selection:C76([ACTIONS:13]))
			APPEND TO ARRAY:C911(SD2_at_ActionCodes; [ACTIONS:13]Action_Code:1)
			APPEND TO ARRAY:C911(SD2_at_ActionNames; [ACTIONS:13]Action_Name:2)
			
			
			ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
			SD2_ActionAttributesToArrays
			$_l_LocationRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
			If ($_l_LocationRow>0)
				If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_LocationRow})>0)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude1; False:C215)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude2; False:C215)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude3; False:C215)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude4; False:C215)
					For ($_l_Index2; 1; Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_LocationRow}))
						$_l_LocationOffset:=Find in array:C230(SD2_al_DiaryLocations; SD2_al_ActionVirtFieldDataMANY{$_l_LocationRow}{$_l_Index2})
						If ($_l_LocationOffset>0)  //it should be
							
							$_ptr_2tr:=Get pointer:C304("SD2_at_ActionInclude"+String:C10($_l_LocationOffset))
							$_ptr_2tr->{Size of array:C274($_ptr_2tr->)}:=True:C214
							
						End if 
					End for 
					$_bo_LocationRowFound:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_LocationRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
					
					
				Else 
					APPEND TO ARRAY:C911(SD2_at_ActionInclude1; True:C214)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude2; True:C214)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude3; False:C215)
					APPEND TO ARRAY:C911(SD2_at_ActionInclude4; False:C215)
					
				End if 
			Else 
				APPEND TO ARRAY:C911(SD2_at_ActionInclude1; True:C214)
				APPEND TO ARRAY:C911(SD2_at_ActionInclude2; True:C214)
				APPEND TO ARRAY:C911(SD2_at_ActionInclude3; False:C215)
				APPEND TO ARRAY:C911(SD2_at_ActionInclude4; False:C215)
				
			End if 
			NEXT RECORD:C51([ACTIONS:13])
			
		End for 
		ARRAY BOOLEAN:C223(SD2_abo_ActionMod; 0)
		ARRAY BOOLEAN:C223(SD2_abo_ActionMod; Size of array:C274(SD2_at_ActionInclude4))
		
		
		
		
		
		LB_SetupListbox(->SD2_lb_Actions; "oSd2"; "CCM_L"; 1; ->SD2_at_ActionCodes; ->SD2_at_ActionNames; ->SD2_at_ActionInclude1; ->SD2_at_ActionInclude2; ->SD2_at_ActionInclude3; ->SD2_at_ActionInclude4; ->SD2_abo_ActionMod)
		LB_SetColumnHeaders(->SD2_lb_Actions; "CCM_L"; 1; "Action Code"; "Action Name"; "In Schedule"; "In Workflow"; "Searches & History only"; "Functions and Timed Actions"; "Modified")
		LB_SetColumnWidths(->SD2_lb_Actions; "oSd2"; 1; 60; 100; 70; 70; 140; 70; 0)
		LB_SetScroll(->SD2_lb_Actions; -2; -2)
		LB_Setdividers(->SD2_lb_Actions; Black:K11:16; 32)
		
		LB_SetEnterable(->SD2_lb_Actions; False:C215; 0)
		LB_SetEnterable(->SD2_lb_Actions; True:C214; 3)
		LB_SetEnterable(->SD2_lb_Actions; True:C214; 4)
		LB_SetEnterable(->SD2_lb_Actions; True:C214; 5)
		LB_SetEnterable(->SD2_lb_Actions; True:C214; 6)
		LB_SetColours(->SD2_lb_Actions; Black:K11:16; Light grey:K11:13; Grey:K11:15)  // stripey - white font black/grey stipes
		
		LB_StyleSettings(->SD2_lb_Actions; "Black"; 9; "SD2_t"; ->[DIARY:12])
		INT_SetDialog
		WS_AutoscreenSize(2; 242; 542)
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM DiaryActionsSetup"; $_t_oldMethodName)
