//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_AskSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_abo_SelectedItems;0)
	//ARRAY BOOLEAN(GEN_abo_ColumnEnterable;0)
	//ARRAY LONGINT(GEN_AL_ColumnWIdth;0)
	//ARRAY POINTER(GEN_aptr_ColumnArrays;0)
	//ARRAY TEXT(GEN_at_ColumnHeader;0)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_ArrayCount; $_l_ArraySize; $_l_CurrentWinRefOLD; $_l_ParameterIndex; $1; $2; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Array; $5)
	C_TEXT:C284($_t_oldMethodName; $10; $11; $12; $13; $14; $15; $16; $17; $18; $19)
	C_TEXT:C284($20; $21; $22; $23; $24; $25; $3; $4; $6; $7; $8)
	C_TEXT:C284($9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_AskSelection")

//Check_Prod2
//$1=Windo Left
//$2=Window Right
//$3=Window Title
//$4=WIndow Message-message to show in window
//$5=pointer to array in which to return row numbers selected(longint array of row numbers-not a boolean array
//$6=Pointer to first array
//$7=Name for column
//$8=width of column
//$9=Enterablility of column
//$9,$10,$11 for column 2 etc etc etc
//NG November 2007 note that at the moment this is set up to receive to columns.
//it will automatically add the boolean 'select' column
If (Count parameters:C259>=8)
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	If ($1>0) & ($2>0)
		WIN_l_CurrentWinRef:=Open window:C153($1; $2; $1; $2; 1984; $3; "Close_Cancel")
		
		
	Else 
		WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-464; <>SYS_l_WindowTop+60; Screen width:C187-4; <>SYS_l_WindowTop+270; 1984; $3; "Close_Cancel")
	End if 
	ARRAY BOOLEAN:C223(GEN_abo_SelectedItems; 0)
	If (Count parameters:C259>=5)
		ARRAY BOOLEAN:C223(GEN_abo_SelectedItems; Size of array:C274($5->))
		For ($_l_ParameterIndex; 1; Size of array:C274($5->))
			GEN_abo_SelectedItems{$_l_ParameterIndex}:=($5->{$_l_ParameterIndex}=1)
		End for 
	End if 
	$_ptr_Array:=Get pointer:C304($6)
	$_l_ArraySize:=Size of array:C274($_ptr_Array->)
	ARRAY BOOLEAN:C223(GEN_abo_SelectedItems; $_l_ArraySize)
	ARRAY POINTER:C280(GEN_aptr_ColumnArrays; 0)
	ARRAY TEXT:C222(GEN_at_ColumnHeader; 0)
	ARRAY LONGINT:C221(GEN_AL_ColumnWIdth; 0)
	ARRAY BOOLEAN:C223(GEN_abo_ColumnEnterable; 0)
	APPEND TO ARRAY:C911(GEN_aptr_ColumnArrays; ->GEN_abo_SelectedItems)
	APPEND TO ARRAY:C911(GEN_at_ColumnHeader; "Select")
	APPEND TO ARRAY:C911(GEN_abo_ColumnEnterable; True:C214)
	APPEND TO ARRAY:C911(GEN_AL_ColumnWIdth; 50)
	$_l_ArrayCount:=((Count parameters:C259-5)/4)+1
	For ($_l_ParameterIndex; 6; Count parameters:C259; 4)
		$_ptr_Array:=Get pointer:C304(${$_l_ParameterIndex})
		APPEND TO ARRAY:C911(GEN_aptr_ColumnArrays; $_ptr_Array)
		
		APPEND TO ARRAY:C911(GEN_at_ColumnHeader; ${$_l_ParameterIndex+1})
		
		APPEND TO ARRAY:C911(GEN_AL_ColumnWIdth; Num:C11(${$_l_ParameterIndex+2}))
		
		
		APPEND TO ARRAY:C911(GEN_abo_ColumnEnterable; (${$_l_ParameterIndex+3}="TRUE"))
	End for 
	DIALOG:C40([USER:15]; "DaskSelect")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	ARRAY LONGINT:C221($5->; 0)
	For ($_l_ParameterIndex; 1; Size of array:C274(GEN_abo_SelectedItems))
		If (GEN_abo_SelectedItems{$_l_ParameterIndex})
			APPEND TO ARRAY:C911($5->; $_l_ParameterIndex)
		End if 
	End for 
End if 
WS_KeepFocus
ERR_MethodTrackerReturn("Gen_AskSelection"; $_t_oldMethodName)