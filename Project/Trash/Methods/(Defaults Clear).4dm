//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Defaults Clear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 21:18:39If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>ProdCode; <>SerialNo; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Defaults Clear")
<>CompCode:=""
<>ContCode:=""
<>CallCode:=""
<>OrderCode:=""
<>JobCode:=""
<>ProdCode:=""
<>SerialNo:=""
ERR_MethodTrackerReturn("Defaults Clear"; $_t_oldMethodName)