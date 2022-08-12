//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI LevelSrc
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
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI LevelSrc")
MESSAGES OFF:C175
QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Component_Level:47=$1)
MESSAGES ON:C181
ERR_MethodTrackerReturn("OrderI LevelSrc"; $_t_oldMethodName)