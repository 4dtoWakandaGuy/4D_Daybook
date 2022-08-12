//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DelBckgrdElem
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DelBckgrdElem")

//NG 19/7/06 This method is a direct replacement for ALDelBckgrdElem
$_t_oldMethodName:=ERR_MethodTracker("LBi_DelBckgrdElem")
DB_t_Methodname:=Current method name:C684
//ALDelBckGrdElem
//clears the Interproc arrays of on particular definition
If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		
	End if 
End if 
ERR_MethodTrackerReturn("LBi_DelBckgrdElem"; $_t_oldMethodName)