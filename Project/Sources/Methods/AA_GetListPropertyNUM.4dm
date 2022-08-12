//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_GetListPropertyNUM
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 13/07/2011 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyNumber; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	C_LONGINT:C283($_l_Access; $_l_ListID; $_l_Offset; $_l_ProcessNum; $_l_Reference; $_l_ReturnValue; $0; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_PropertyName; $2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetListPropertyNUM")
//This method will return the value of a property from a LIST(Not a list item) where the value returned will be numertic

If (Count parameters:C259>=2)
	$_l_ListID:=$1
	$_t_PropertyName:=$2
	$_l_ReturnValue:=0
	If ([X_LISTS:111]x_ID:1#$_l_ListID)
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
	End if 
	$0:=0
	If (BLOB size:C605([X_LISTS:111]x_ListValues:6)>0)
		$_l_Offset:=0
		BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyNames; $_l_Offset)
		BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_al_PropertyNumber; $_l_Offset)
		BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyValue; $_l_Offset)
		$_l_Reference:=Find in array:C230($_at_PropertyNames; $2)
		If ($_l_Reference>0)
			$_l_Access:=$_al_PropertyNumber{$_l_Reference}
		Else 
			$_l_Access:=0
		End if 
		$0:=$_l_Access
	Else 
		If (BLOB size:C605([X_LISTS:111]x_ListAttributes:3)>0) & (BLOB size:C605([X_LISTS:111]x_ListValues:6)=0)
			UNLOAD RECORD:C212([X_LISTS:111])
			
			$_l_ProcessNum:=New process:C317("AA_UpdateListProperties"; 256000; "UpdatingListProperties")
			While (Process state:C330($_l_ProcessNum)>=0) & ($_l_ProcessNum>0)
				
				$_t_ProcessName:=Process_Name($_l_ProcessNum)
				If ($_t_ProcessName="UpdatingListProperties")
					DelayTicks
				Else 
					$_l_ProcessNum:=0
				End if 
			End while 
			LOAD RECORD:C52([X_LISTS:111])
			$_l_Offset:=0
			BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyNames; $_l_Offset)
			BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_al_PropertyNumber; $_l_Offset)
			BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyValue; $_l_Offset)
			$_l_Reference:=Find in array:C230($_at_PropertyNames; $2)
			If ($_l_Reference>0)
				$_l_Access:=$_al_PropertyNumber{$_l_Reference}
			Else 
				$_l_Access:=0
			End if 
			$0:=$_l_Access
		End if 
	End if 
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("AA_GetListPropertyNUM"; $_t_oldMethodName)