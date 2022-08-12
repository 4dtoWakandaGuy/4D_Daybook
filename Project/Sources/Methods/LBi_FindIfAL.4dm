//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_FindIfAL
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283(vALLevels)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindIfAL")

//NG 20/7/2006 This method is a replacement for ALLfindifAL

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindIfAL")
//ALFindIfAL - do a Find line if AL is used to find one current record

If (vALLevels>0)
	$0:=(LBi_FindLine($1))
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("LBi_FindIfAL"; $_t_oldMethodName)