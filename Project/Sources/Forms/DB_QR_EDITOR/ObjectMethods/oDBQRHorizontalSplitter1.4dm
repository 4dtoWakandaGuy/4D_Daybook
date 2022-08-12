If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oDBQRHorizontalSplitter1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2013 12:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; DBQR_l_HorizontalSplitterPos)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oDBQRHorizontalSplitter1"; Form event code:C388)

$_l_event:=Form event code:C388



Case of 
		
	: ($_l_event=On Clicked:K2:4)
		OBJECT GET COORDINATES:C663(*; "oDBQRHorizontalSplitter"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		If ($_l_ObjectTop#DBQR_l_HorizontalSplitterPos)
			DBQR_l_HorizontalSplitterPos:=$_l_ObjectTop
			DBQR_SetWindowSettings
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oDBQRHorizontalSplitter1"; $_t_oldMethodName)
