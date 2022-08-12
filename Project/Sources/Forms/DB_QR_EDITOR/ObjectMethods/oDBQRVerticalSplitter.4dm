If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oDBQRVerticalSplitter
	//------------------ Method Notes ------------------(Changed to)
	
	
	
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created:  04/12/2011 02:41 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; DBQr_l_VerticalSplitterPos)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oDBQRVerticalSplitter"; Form event code:C388)


$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		OBJECT GET COORDINATES:C663(*; "oDBQRVerticalSplitter"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		If ($_l_ObjectLeft#DBQr_l_VerticalSplitterPos)
			DBQr_l_VerticalSplitterPos:=$_l_ObjectLeft
			DBQR_SetWindowSettings
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oDBQRVerticalSplitter"; $_t_oldMethodName)
