If (False:C215)
	//Table Form Method Name: [COMPANIES]dAlert_2Col
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts; DB_bo_AlertReply; DB_bo_AlertTimeOut; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; DB_l_FormTImeCalled; DB_l_SetTimeOut)
	C_TEXT:C284(<>ButtOK; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAlert_2Col"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Timer:K2:25)
		If (DB_bo_AlertTimeOut)
			
			
			If ((BP_Timestamp-DB_l_FormTImeCalled)>=DB_l_SetTimeOut)
				DB_bo_AlertReply:=True:C214  // this is set so the system knows it auto cancelled
				CANCEL:C270
			End if 
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAlert_2Col")
		
		SET TIMER:C645(120)
		DB_l_FormTImeCalled:=BP_Timestamp
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Alert"; 0)
		End if 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAlert_2Col"; $_t_oldMethodName)
