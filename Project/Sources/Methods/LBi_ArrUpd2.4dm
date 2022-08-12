//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ArrUpd2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($_Ptr_ListBox; $_Ptr_ListBoxVar; $_Ptr_ListBoxVar2; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ArrUpd2")

//NG 21/7/06 This method is a replacement for ALArrUpd2
DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=1)
	$_Ptr_ListBoxVar:=$1
	If (GenValidatePointer($_Ptr_ListBoxVar))
		RESOLVE POINTER:C394($_Ptr_ListBoxVar; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_Ptr_ListBoxVar2:=Get pointer:C304($_t_VariableName)
		If (Type:C295($_Ptr_ListBoxVar->)=13)  //it is a 2D array
			$_Ptr_ListBox:=$_Ptr_ListBoxVar2->{$_l_TableNumber}{1}
		Else 
			$_Ptr_ListBox:=$_Ptr_ListBoxVar->{1}
		End if 
	End if 
End if 
//No Need to for the following so the method is probably redundant

//AL_UpdateArrays ($_Ptr_ListBox->;-2)
ERR_MethodTrackerReturn("LBi_ArrUpd2"; $_t_oldMethodName)