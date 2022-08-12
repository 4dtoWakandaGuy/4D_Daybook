If (False:C215)
	//Table Form Method Name: [USER]Error_Report
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/02/2010 12:19
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Err_at_aAttachements;0)
	//ARRAY TEXT(Err_at_aAttachementsPATH;0)
	C_BOOLEAN:C305($_bo_NoTrack; DB_bo_NoLoad; SYS_bo_NoTrack)
	C_LONGINT:C283($_l_event; Err_l_Manualreport)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Error_Report"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		$_bo_NoTrack:=SYS_bo_NoTrack
		SYS_bo_NoTrack:=True:C214
		ARRAY TEXT:C222(Err_at_aAttachements; 0)
		ARRAY TEXT:C222(Err_at_aAttachementsPATH; 0)
		WS_AutoscreenSize(3; 200; 411)
		SET WINDOW TITLE:C213("Error Report")
		If (Not:C34(User in group:C338(Current user:C182; "Designer")))  //at least give us the chance to skip it`
			OBJECT SET VISIBLE:C603(*; "oButCancel@"; False:C215)
		End if 
		OBJECT SET VISIBLE:C603(Err_at_aAttachements; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAttachLabel@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAttachPrompt@"; True:C214)
		If (Err_l_Manualreport>0)
			WS_AutoscreenSize(3; 550; 410)
			FORM GOTO PAGE:C247(3)
			OBJECT SET VISIBLE:C603(*; "oButCancel@"; True:C214)
		End if 
		If (Is macOS:C1572)
			OBJECT SET VISIBLE:C603(*; "baddScreenshot@"; True:C214)
			
		Else 
			OBJECT SET VISIBLE:C603(*; "baddScreenshot@"; False:C215)
		End if 
		
		Err_l_Manualreport:=0
		SYS_bo_NoTrack:=$_bo_NoTrack
End case 
ERR_MethodTrackerReturn("FM [USER].Error_Report"; $_t_oldMethodName)
