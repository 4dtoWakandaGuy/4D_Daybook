//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_LPCompCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ch1; $_l_ch2; ch1; ch2; cNAL)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_CompName; $_t_ContCode; vCompName; vContCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_LPCompCode")
If (cNAL=0)
	$_t_CompName:=vCompName
	$_t_ContCode:=vContCode
	$_l_ch1:=ch1
	$_l_ch2:=ch2
	Check_CompanyNC($1; ->[CONTACTS:1]Contact_Code:2; $2)
	vCompName:=$_t_CompName
	vContCode:=$_t_ContCode
	ch1:=$_l_ch1
	ch2:=$_l_ch2
End if 
ERR_MethodTrackerReturn("Sel_LPCompCode"; $_t_oldMethodName)