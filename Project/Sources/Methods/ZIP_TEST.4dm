//%attributes = {}
If (False:C215)
	//Project Method Name:      ZIP_TEST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2010 18:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(ZIP_R_LatEast; ZIP_R_LATWest; ZIP_R_LongNorth; ZIP_R_LongSouth)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZIP_TEST")

ZIP_CalculateByDistance(""; 37.216532; -121.856486; 10; ->ZIP_R_LongNorth; ->ZIP_R_LongSouth; ->ZIP_R_LATWest; ->ZIP_R_LatEast)
ERR_MethodTrackerReturn("ZIP_TEST"; $_t_oldMethodName)