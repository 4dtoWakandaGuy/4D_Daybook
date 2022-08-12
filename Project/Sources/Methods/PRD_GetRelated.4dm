//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_GetRelated
	//------------------ Method Notes ------------------
	//This is a simple method that querys for a product code($1)and puts the Product name into a var in the calling process($2). This is so as not to move the current record pointer
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2010 14:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1; PRD_t_RelatedName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_GetRelated")
If (Count parameters:C259>=2)
	If ($1#"")
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$1)
		If ($2>0)
			PRD_t_RelatedName:=[PRODUCTS:9]Product_Name:2
			SET PROCESS VARIABLE:C370($2; PRD_t_RelatedName; PRD_t_RelatedName)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("PRD_GetRelated"; $_t_oldMethodName)
