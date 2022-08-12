//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclSetupClHe
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
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclSetupClHe")

//21/7/2006 This method is a direct replacement for ALinclSetupClhe
//ALInclSetupClHe - Clear Height
$_Ptr_ListBox:=$1->{1}

LISTBOX SET ROWS HEIGHT:C835($_Ptr_ListBox->; 16)
ERR_MethodTrackerReturn("LBi_InclSetupClHe"; $_t_oldMethodName)