//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetColumnHeadersByObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_NextButton; $0; $3)
	C_POINTER:C301($_Ptr_ButtonPointer)
	C_TEXT:C284($_t_ButtonPrefix; $_t_HeaderName; $_t_OldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_OldMethodName:=ERR_MethodTracker("LB_SetColumnHeadersbyObjectName")


If (Count parameters:C259>=3)
	
	$_l_NextButton:=$3
	$_t_ButtonPrefix:=$2+"_BUT"
	
	For ($_l_Index; 4; Count parameters:C259)
		$_Ptr_ButtonPointer:=Get pointer:C304($_t_ButtonPrefix+String:C10($_l_NextButton))
		$_t_HeaderName:=${$_l_Index}
		OBJECT SET TITLE:C194($_Ptr_ButtonPointer->; $_t_HeaderName)
		$0:=$_l_NextButton
		$_l_NextButton:=$_l_NextButton+1
	End for 
End if 
ERR_MethodTrackerReturn("LB_SetColumnHeaders"; $_t_OldMethodName)