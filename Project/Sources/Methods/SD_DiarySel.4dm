//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_DiarySel
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
	C_BOOLEAN:C305(<>SD_bo_ViewingList)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_DiarySel")
//this method is used to pass the current selection from the super diary to to old
//this is used to enable editing/sorting of diary records in way that are not poss
//possible in the SD window


USE SET:C118("◊PassedSet")
CLEAR SET:C117("◊PassedSet")


<>SD_bo_ViewingList:=False:C215
ERR_MethodTrackerReturn("SD_DiarySel"; $_t_oldMethodName)