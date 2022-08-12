//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_GetMarginAndMarginPercent
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
	C_POINTER:C301($_ptr_margin; $_ptr_marginPercent; $3; $4)
	C_TEXT:C284($_t_CostAmount; $_t_oldMethodName; $_t_SalesAmount; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_GetMarginAndMarginPercent")

//Added 15/03/07 -kmw
//
//Used to calculate on the fly a string version of a Margin and Margin Percent where we don't have these values stored in the fields already
//Used by text totals list box areas on Job and Job Stages
//
//
$_t_oldMethodName:=ERR_MethodTracker("JC_GetMarginAndMarginPercent")


If (Count parameters:C259>=4)  //
	$_t_SalesAmount:=$1
	$_t_CostAmount:=$2
	$_ptr_margin:=$3
	$_ptr_marginPercent:=$4
	//
	If ($_t_SalesAmount="(@)")  //check if string passed in represents its value using brackets (presumably for a negative) in which case must convert string to a more standard negative representation because num just "sees" bracketed negative values as positive values
		$_t_SalesAmount:=String:C10((Num:C11($_t_SalesAmount)*-1))
	End if 
	If ($_t_CostAmount="(@)")  //check if string passed in represents its value using brackets (presumably for a negative) in which case must convert string to a more standard negative representation because num just "sees" bracketed negative values as positive values
		$_t_CostAmount:=String:C10((Num:C11($_t_CostAmount)*-1))
	End if 
	//
	$_ptr_margin->:=String:C10((Num:C11($_t_SalesAmount)-Num:C11($_t_CostAmount)); "|Accounts")
	//
	If (Num:C11($_t_SalesAmount)>0)
		$_ptr_marginPercent->:=String:C10(((Num:C11($_ptr_margin->)/Num:C11($_t_SalesAmount))*100); "|PercentNZ")
	Else 
		$_ptr_marginPercent->:=String:C10(0; "|PercentNZ")
	End if 
End if 
ERR_MethodTrackerReturn("JC_GetMarginAndMarginPercent"; $_t_oldMethodName)