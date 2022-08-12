//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelPOther
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_ptr_MasterRelatedField; $_ptr_MasterSetTable; $1; $2)
	C_TEXT:C284($_t_CompanyName; $_t_oldMethodName; $_t_SetName; $3; $4)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Comp_SelPOther")
$_ptr_MasterSetTable:=$1
$_ptr_masterRelatedField:=$2
$_t_SetName:=$3
If (Count parameters:C259>=4)
	$_t_CompanyName:=$4
End if 
Sel_SetAny($_t_SetName; $_ptr_MasterSetTable)
//DEFAULT TABLE([COMPANIES])
Sel_Beginning3(->[COMPANIES:2])
If (Count parameters:C259>=4)
	Comp_SelPName($_t_CompanyName)
	
Else 
	Comp_SelPName
End if 

Master_UseSS(->[COMPANIES:2])
//DEFAULT TABLE($_ptr_MasterSetTable->)
Load_ManyFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; $_t_SetName; $_ptr_MasterRelatedField; $_ptr_MasterSetTable)
ERR_MethodTrackerReturn("Comp_SelPOther"; $_t_oldMethodName)