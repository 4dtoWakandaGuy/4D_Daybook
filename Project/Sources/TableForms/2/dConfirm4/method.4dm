If (False:C215)
	//Table Form Method Name: [COMPANIES]dConfirm4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_DoNotShowCHeckBox; DB_bo_AlertReply; DB_bo_AlertTimeOut; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; DB_l_FormTImeCalled; DB_l_SetTimeOut)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dConfirm4"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Timer:K2:25)
		SHOW PROCESS:C325(Current process:C322)
		If (Frontmost process:C327(*)#Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		If (DB_bo_AlertTimeOut)
			
			
			If ((BP_Timestamp-DB_l_FormTImeCalled)>=DB_l_SetTimeOut)
				DB_bo_AlertReply:=True:C214  // this is set so the system knows it auto cancelled
				CANCEL:C270
			End if 
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dConfirm4")
		
		SET TIMER:C645(120)
		DB_l_FormTImeCalled:=BP_Timestamp
		OBJECT SET VISIBLE:C603(*; "ocb_dConfirm4"; DB_bo_DoNotShowCHeckBox)
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>ButtCanc#"")
			OBJECT SET TITLE:C194(xCancel; <>ButtCanc)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Confirm"; 0)
		End if 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dConfirm4"; $_t_oldMethodName)
