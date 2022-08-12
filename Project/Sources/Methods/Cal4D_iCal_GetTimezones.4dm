//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetTimezones
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 14:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_ptr_ZonesArray; $1)
	C_TEXT:C284($_t_MethodName; $_t_Msg; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetTimezones")


$_ptr_ZonesArray:=$1
$_t_Msg:=$2


If ($_t_Msg="DT")
	STRING LIST TO ARRAY:C511(16002; $_ptr_ZonesArray->)
Else 
	STRING LIST TO ARRAY:C511(16001; $_ptr_ZonesArray->)
End if 
ERR_MethodTrackerReturn("Cal4D_iCal_GetTimezones"; $_t_oldMethodName)