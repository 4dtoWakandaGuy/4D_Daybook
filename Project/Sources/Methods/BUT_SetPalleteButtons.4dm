//%attributes = {}

If (False:C215)
	//Project Method Name:      BUT_SetPalleteButtons
	//------------------ Method Notes ------------------
	//this method is a replacement for WS_SetPalletButtons
	//here instead of a long list of buttons to enable/disable we pass 1 or 2 collection in an object AND we pass other values
	
	//------------------ Revision Control ----------------
	//Date Created:  28/04/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_HelpTexts; 0)
	C_BOOLEAN:C305($_bo_Enabled)
	C_COLLECTION:C1488($_COL_ButtonSettings)
	C_LONGINT:C283($_l_ButtonsCount; $_l_CurrentButton; $_l_GetButtons; $_l_index; $_l_Setbutton)
	C_OBJECT:C1216($_obj_ButtonSettings; $1)
	C_POINTER:C301($_ptr_Button3; $_ptr_CurrenctButton; $_ptr_CurrentButton)
End if 
//Code Starts Here
STRING LIST TO ARRAY:C511(17000; $_at_HelpTexts)  //<-Need to store this somewhere 

$_l_ButtonsCount:=33
$_COL_ButtonSettings:=New collection:C1472
//$_COL_ButtonSettings.resize($_l_ButtonsCount)

If (Count parameters:C259>=1)
	$_obj_ButtonSettings:=$1
	For ($_l_CurrentButton; 1; $_l_ButtonsCount)
		$_ptr_CurrentButton:=Get pointer:C304("PAL_BUTTON_"+String:C10($_l_CurrentButton))
		If (Not:C34($_ptr_CurrentButton->=Null:C1517))
			//$_bo_Enabled:=OBJECT Get enabled($_ptr_CurrentButton->)
			//$_COL_ButtonSettings[$_l_CurrentButton-1]:=$_bo_Enabled
			If (Not:C34($_Obj_ButtonSettings.enablebuttons=Null:C1517))  //here we only test the enabled
				$_l_index:=$_Obj_ButtonSettings.enablebuttons.indexOf($_l_CurrentButton)
				If ($_l_index>=0)
					OBJECT SET ENABLED:C1123($_ptr_CurrentButton->; True:C214)  //set this enabled
				End if 
			End if 
			If (Not:C34($_Obj_ButtonSettings.disablebuttons=Null:C1517))  //not setting any to disabled
				$_l_index:=$_Obj_ButtonSettings.disablebuttons.indexOf($_l_CurrentButton)
				If ($_l_index>=0)
					OBJECT SET ENABLED:C1123($_ptr_CurrentButton->; False:C215)
				Else 
					If (($_Obj_ButtonSettings.enablebuttons=Null:C1517))  //if we did not selectively set enabled then all others are enabled
						OBJECT SET ENABLED:C1123($_ptr_CurrentButton->; True:C214)
					End if 
				End if 
			Else 
				If (($_Obj_ButtonSettings.enablebuttons=Null:C1517))  //iif not setting any to enabled either then all are enabled
					OBJECT SET ENABLED:C1123($_ptr_CurrentButton->; True:C214)
				Else 
					//if we did not set enabled then it is disabled if we did set enabled then we already did it
					$_l_index:=$_Obj_ButtonSettings.enablebuttons.indexOf($_l_CurrentButton)
					If ($_l_index<0)
						OBJECT SET ENABLED:C1123($_ptr_CurrentButton->; False:C215)
					End if 
				End if 
			End if 
		End if 
	End for 
	//$_ptr_CurrentButton:=Get pointer()
	$_bo_Enabled:=OBJECT Get enabled:C1079(*; "oMinusButton")
	OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oMinusButton"; True:C214)
	If ($_bo_Enabled)  //then deletions are available-but which to use
		If (Not:C34($_Obj_ButtonSettings.MinusOptions=Null:C1517))
			If ($_Obj_ButtonSettings.MinusOptions.length>0)
				OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oMinusButton"; False:C215)
				
			End if 
		End if 
		
	Else 
	End if 
	
	
	
End if 

