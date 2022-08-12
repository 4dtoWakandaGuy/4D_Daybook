If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oDiaryItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_lb_DiaryItems;0)
	//ARRAY TEXT(SD_at_DiaryCodes;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oDiaryItems"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Selection Change:K2:29)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			LISTBOX SELECT ROW:C912(SC_lb_DiaryItems; $_l_Row; 0)
			QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=SD_at_DiaryCodes{$_l_Row})
			SC_LoadDiaryRecord(SD_at_DiaryCodes{$_l_Row})
			
			
		End if 
	: ($_l_event=On Double Clicked:K2:5)
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oDiaryItems"; $_t_oldMethodName)
