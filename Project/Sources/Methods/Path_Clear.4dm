//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_Clear
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
	C_TEXT:C284(<>PathName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_Clear")
<>PathName:=""
[USER:15]Path Name:12:=<>PathName
[USER:15]Limit Date:58:=!00-00-00!
DB_SaveRecord(->[USER:15])
ERR_MethodTrackerReturn("Path_Clear"; $_t_oldMethodName)