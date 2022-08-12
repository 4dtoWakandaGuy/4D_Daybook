//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_FindsifAl
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
	//Array POINTER(ORD_aPtr_OrderItemsSetup;0)
	C_BOOLEAN:C305($0; $2)
	C_LONGINT:C283(vALLevels)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindsifAl")

//NG 20/07/06 This method is areplacement for ALFindsifal
//NG this method is not called

$_t_oldMethodName:=ERR_MethodTracker("LBi_FindsifAl")
//ALFindIfAL - do a Find lines if AL is used to find one current record
If (vALLevels>0)
	$0:=(LBi_FindLine(->ORD_aPtr_OrderItemsSetup))
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("LBi_FindsifAl"; $_t_oldMethodName)