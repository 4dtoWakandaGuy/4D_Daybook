If (False:C215)
	//object Name: [DIARY]SD2_DefWorkflowEntry.oActionCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_POINTER:C301(SD2_ptr_SearchField)
	C_REAL:C285(SD2_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_EditedText; $_t_oldMethodName; SD2_t_SRCH_Text)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefWorkflowEntry.oActionCode"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
	: ($_l_event=On After Keystroke:K2:26)
		SET TIMER:C645(10)
		SD2_ptr_SearchField:=->[DIARY:12]Action_Code:9
		$_t_EditedText:=Get edited text:C655
		If (Length:C16($_t_EditedText)=1)
			SRCH_r_TimerOLD:=0
			SD2_r_Timer:=0
		End if 
		SD2_t_SRCH_Text:=$_t_EditedText
		
	: ($_l_event=On Getting Focus:K2:7)
		
		
	: ($_l_event=On Losing Focus:K2:8)
		$_t_EditedText:=Get edited text:C655
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefWorkflowEntry.oActionCode"; $_t_oldMethodName)
