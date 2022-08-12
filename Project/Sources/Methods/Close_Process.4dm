//%attributes = {}
If (False:C215)
	//Project Method Name:      Close_Process
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; ORD_bo_QuickAddMode)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; DB_l_ButtonClickedFunction; iCancel; iOK; oOK; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xDelete; xOK)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; UTI_t_CloseMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Close_Process"; 0; "Modified:"+String:C10(Num:C11(DB_bo_RecordModified)))
//Close_Process
Menu_Record("Close_Process"; "Close Window")
//NG--why should this work different to
//pressing the save/cancel buttons
//except for asking if we want to
//MODIFIED NG APRIL 2000
If (DB_bo_RecordModified=False:C215)
	If (ORD_bo_QuickAddMode)
		If (Size of array:C274(ORD_AT_QuickAddProdCode)=1)
			If (((ORD_AT_QuickAddProdCode{1}#"") | (ORD_AT_QuickAddProdName{1}#"")) & (ORD_ar_QuickAddQuantity{1}#0))
				UTI_t_CloseMessage:="Do you want to save the changes?"
				$_l_ScreenCentreVertical:=Screen width:C187/2
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-182; 80; $_l_ScreenCentreVertical+182; 175)
				DIALOG:C40([COMPANIES:2]; "dClose")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				If (OK=1)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Save Quick Add")
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel Quick Add")
				End if 
			End if 
		Else 
			//Just cancel
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel Quick Add")
		End if 
	Else 
		iCancel:=1
		<>SYS_l_CancelProcess:=Current process:C322
		DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
		POST OUTSIDE CALL:C329(Current process:C322)
	End if 
Else 
	If (ORD_bo_QuickAddMode)
		If (Size of array:C274(ORD_AT_QuickAddProdCode)=1)
			If (((ORD_AT_QuickAddProdCode{1}#"") | (ORD_AT_QuickAddProdName{1}#"")) & (ORD_ar_QuickAddQuantity{1}#0))
				UTI_t_CloseMessage:="Do you want to save the changes?"
				$_l_ScreenCentreVertical:=Screen width:C187/2
				$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
				WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-182; 80; $_l_ScreenCentreVertical+182; 175)
				DIALOG:C40([COMPANIES:2]; "dClose")
				CLOSE WINDOW:C154
				WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
				If (OK=1)
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Save Quick Add")
				Else 
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel Quick Add")
				End if 
				
			Else 
				//Just cancel
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel Quick Add")
			End if 
		Else 
			UTI_t_CloseMessage:="Do you want to save the changes?"
			$_l_ScreenCentreVertical:=Screen width:C187/2
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-182; 80; $_l_ScreenCentreVertical+182; 175)
			DIALOG:C40([COMPANIES:2]; "dClose")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			If (OK=1)
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Save Quick Add")
			Else 
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel Quick Add")
			End if 
		End if 
		
	Else 
		If (DB_t_CallOnCloseorSave="")
			CANCEL:C270
		Else 
			If (DB_t_CallOnCloseorSave="OutClose")
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Close")
				
				oOK:=1
			Else 
				If (DB_bo_RecordModified=False:C215)
					iCancel:=1
					<>SYS_l_CancelProcess:=Current process:C322
				Else 
					UTI_t_CloseMessage:="Do you want to save the changes?"
					$_l_ScreenCentreVertical:=Screen width:C187/2
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-182; 80; $_l_ScreenCentreVertical+182; 175)
					DIALOG:C40([COMPANIES:2]; "dClose")
					CLOSE WINDOW:C154
					WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
					If (OK=1)
						iOK:=1
						If (xOK=1)
							DB_t_CallOnCloseorSave:="Close"
						End if 
						
					Else 
						If (xDelete=1)
							//In V6 at least the form eve
							iCancel:=1
							<>SYS_l_CancelProcess:=Current process:C322
							DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
							
							
						End if 
					End if 
					POST OUTSIDE CALL:C329(Current process:C322)
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Close_Process"; $_t_oldMethodName)