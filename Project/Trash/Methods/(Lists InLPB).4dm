//%attributes = {}
If (False:C215)
	//Project Method Name:      Lists_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_oldMethodName; vButtDisLISTS)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Lists_InLPB")
If (vAdd=1)
	//  ◊aListName:=1  `Change
	//  [LISTS]List Name:=◊aListName{◊aListName}
Else 
	// ◊aListName:=Find in array(◊aListName;[LISTS]List Name)
	//If (◊aListName=0)
	//  ◊aListName:=1
	// End if
End if 
vButtDisLISTS:="I  PMO  FSSSRCADT"
Input_Buttons(->[LIST_ITEMS:95]; ->vButtDisLISTS)
ERR_MethodTrackerReturn("Lists_InLPB"; $_t_oldMethodName)