If (False:C215)
	//Table Form Method Name: [SCRIPTS]dScripts_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2012 11:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vSDateF; vSDateT)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_defaultparams; $_l_event; VsDateFOffset; VsDatetOffset)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SCRIPTS].dScripts_Sel"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		VsDateTOffset:=0
		VsDateFoffset:=0
		vSDateF:=!00-00-00!
		vSDateT:=!00-00-00!
		SET MENU BAR:C67(57)
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		OpenHelp(Table:C252(->[SCRIPTS:80]); "dScripts_Sel")
		SM_LoadSearchParameterNames(Table:C252(->[SCRIPTS:80]))
		
		INT_SetDialog
		$_l_defaultparams:=Sm_SetUserSearchPrefs(False:C215; Table:C252(->[SCRIPTS:80]); <>PER_l_CurrentUserID)
		If ($_l_defaultparams>0)
			SM_LoadSearchParameters($_l_defaultparams)
			
		End if 
End case 
Sel_LProc2(->[SCRIPTS:80])
ERR_MethodTrackerReturn("FM:dMacros_Sel"; $_t_oldMethodName)
