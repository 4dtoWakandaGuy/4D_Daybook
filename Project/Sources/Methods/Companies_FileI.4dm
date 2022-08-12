//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_FileI
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
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(QUAL_aptr_Information;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_FileI")

FORM SET INPUT:C55([COMPANIES:2]; "Company_In")  //NG April 2004 removed reference to ◊screen and reference to S
WIN_t_CurrentInputForm:="Company_In"
ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
ARRAY POINTER:C280(COM_aPtr_CoFurthers; 0)
ARRAY POINTER:C280(QUAL_aptr_Information; 0)
ERR_MethodTrackerReturn("Companies_FileI"; $_t_oldMethodName)