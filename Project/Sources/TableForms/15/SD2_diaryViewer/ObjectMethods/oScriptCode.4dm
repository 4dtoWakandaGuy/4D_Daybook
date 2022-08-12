If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oScriptCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD2_D_DateFromFilter)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oScriptCode"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		
		If (SD2_D_DateFromFilter=!00-00-00!)
			SD2_D_DateFromFilter:=Current date:C33(*)
		Else 
			
			SD2_D_DateFromFilter:=SD2_D_DateFromFilter+1
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oScriptCode"; $_t_oldMethodName)
