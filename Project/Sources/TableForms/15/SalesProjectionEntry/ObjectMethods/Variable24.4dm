If (False:C215)
	//object Name: [USER]SalesProjectionEntry.Variable24
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SalesProjectionEntry.Variable24"; Form event code:C388)
If (SP_at_SalesProjectionTYPE>0)
	SP_Scpt_aSalesProjectionType
	//````
End if 
ERR_MethodTrackerReturn("OBJ [USER].SalesProjectionEntry.Variable24"; $_t_oldMethodName)
