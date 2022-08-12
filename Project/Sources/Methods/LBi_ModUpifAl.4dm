//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ModUpifAl
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
	C_LONGINT:C283($_l_Column; $_l_Row; vALLevels)
	C_POINTER:C301($_Ptr_Variable; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModUpifAl")

//This method is a replacement for ALModUpifAL
//TRACE
//ALModUpIfAL - Update one AL record if AL in use
$_Ptr_Variable:=$1->{1}
LISTBOX GET CELL POSITION:C971($_Ptr_Variable->; $_l_Column; $_l_Row)

If (vALLevels>0)
	//NG todo the row number needs to be obtained
	LBi_ArrUpdate($1; $_l_Row; False:C215)  //return the values to the arrays
	//LB_LoadFtrs($1)
End if 
ERR_MethodTrackerReturn("LBi_ModUpifAl"; $_t_oldMethodName)