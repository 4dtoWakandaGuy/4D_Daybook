//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_WindowCallBack
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/05/2010 17:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MenuItemParameterNumber; $_l_Process; DB_l_ButtonClickedFunction)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_WindowCallBack")

//Menu_PalButt - see also scripts of Silver & Gold Buttons Palettes
//this one is the same as Silver

$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter="")
	$_t_MenuItemParameter:="2"
End if 
If ($_t_MenuItemParameter#"")
	
	
	$_l_MenuItemParameterNumber:=Num:C11($_t_MenuItemParameter)
	$_l_Process:=Current process:C322
	
	
	Case of 
		: ($_l_MenuItemParameterNumber=2)
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Cancel")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=1)
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("OK")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=3)
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Delete")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=5)  //4
			If (Substring:C12(BUT_p_ButtonStringPointer->; 1; 1)="I")
				If (Substring:C12(BUT_p_ButtonStringPointer->; 4; 1)#"P")
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
			Else 
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Plus")
				POST OUTSIDE CALL:C329($_l_Process)
			End if 
		: ($_l_MenuItemParameterNumber=7)  //5
			If (Substring:C12(BUT_p_ButtonStringPointer->; 1; 1)="I")
				If (Substring:C12(BUT_p_ButtonStringPointer->; 5; 1)#"M")
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
			Else 
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Minus")
				POST OUTSIDE CALL:C329($_l_Process)
			End if 
		: ($_l_MenuItemParameterNumber=6)
			If (Substring:C12(BUT_p_ButtonStringPointer->; 1; 1)="I")
				If (Substring:C12(BUT_p_ButtonStringPointer->; 6; 1)#"O")
					DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Open")
					POST OUTSIDE CALL:C329($_l_Process)
				End if 
			Else 
				DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Open")
				POST OUTSIDE CALL:C329($_l_Process)
			End if 
		: ($_l_MenuItemParameterNumber=10)  //7
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Previous")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=9)  //8
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Next")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=12)  //9
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Select")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=17)  //10
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Apply")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=13)  //11
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Sort")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=14)  //12
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Count")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=15)  //13
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Report")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=16)  //14
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Graph")
			POST OUTSIDE CALL:C329($_l_Process)
		: ($_l_MenuItemParameterNumber=99)  //14
			
			
			//have to call the window and it has to call quit to user
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("Q2U")
			
			POST OUTSIDE CALL:C329($_l_Process)
	End case 
End if 
ERR_MethodTrackerReturn("DB_WindowCallBack"; $_t_oldMethodName)