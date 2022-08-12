//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_Choices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $0; $1; GEN_CB1; GEN_CB10; GEN_CB2; GEN_CB3; GEN_CB4; GEN_CB5; GEN_CB6)
	C_LONGINT:C283(GEN_CB7; GEN_CB8; GEN_CB9; Gen_ChoicePage; GEN_OK; GEN_Rad1; GEN_Rad10; GEN_Rad2; GEN_Rad3; GEN_Rad4; GEN_Rad5)
	C_LONGINT:C283(GEN_Rad6; GEN_Rad7; GEN_Rad8; GEN_Rad9; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; Gen_ChoiceText1; Gen_ChoiceText10; Gen_ChoiceText2; Gen_ChoiceText3; Gen_ChoiceText4; Gen_ChoiceText5; Gen_ChoiceText6; Gen_ChoiceText7; Gen_ChoiceText8; Gen_ChoiceText9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_Choices")
//this method calls a generic window with
//either radio buttons(choose one of)
//or check boxes-choose multiple
If (Count parameters:C259>=3)
	Gen_ChoicePage:=$1
	For ($_l_Index; 1; 10)
		$_ptr_Variable:=Get pointer:C304("Gen_ChoiceText"+String:C10($_l_Index))
		If ((Count parameters:C259)>=($_l_Index+1))
			$_ptr_Variable->:=${$_l_Index+1}
		Else 
			$_ptr_Variable->:=""
		End if 
	End for 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	
	DIALOG:C40([USER:15]; "General_ChoiceFORM")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	$0:=Gen_Ok
	Gen_OK:=0
	
End if 
ERR_MethodTrackerReturn("GEN_Choices"; $_t_oldMethodName)