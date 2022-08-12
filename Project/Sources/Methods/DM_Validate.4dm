//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_Validate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_LONGINT:C283($1; $2; $3; $4)
	C_POINTER:C301($7; $8)
	C_TEXT:C284($_t_DetailSTR; $_t_HeaderSTR; $_t_oldMethodName; $5; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_Validate")
//NOTE The above is a change from the spec

If (Count parameters:C259>=4)
	If (Count parameters:C259>=5)
		$_t_HeaderSTR:=$5
	Else 
		$_t_HeaderSTR:="Header"
	End if 
	If (Count parameters:C259>=6)
		$_t_DetailSTR:=$6
	Else 
		$_t_DetailSTR:="Detail"
	End if 
	$_bo_OK:=False:C215
	Case of 
		: ($2=2)  //Contacts
			$_bo_OK:=DM_ValidateContact($1; $3; $4; $_t_HeaderSTR; $_t_DetailSTR; $7; $8)
		: ($2=25)  //order items and orders
			$_bo_OK:=DM_ValidateOrder($1; $3; $4; $_t_HeaderSTR; $_t_DetailSTR)
			//etc etc etc
		: ($2=Table:C252(->[PRODUCTS:9]))
			$_bo_OK:=DM_ValidateProduct($1; $3; $4; $_t_HeaderSTR; $_t_DetailSTR; $7)
		: ($2=Table:C252(->[DIARY:12]))
			DM_VALIDATEDIARY($1; $3; $4; $_t_HeaderSTR)
	End case 
End if 

$0:=$_bo_OK
ERR_MethodTrackerReturn("DM_Validate"; $_t_oldMethodName)