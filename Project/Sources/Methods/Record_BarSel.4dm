//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_BarSel
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
	C_TEXT:C284(<>KEYS; $_t_oldMethodName; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarSel")
Start_Process("Find Macros")
vSelPrev:=""
<>Keys:=""
Macros_Sel
CUT NAMED SELECTION:C334([SCRIPTS:80]; "◊Macros")
ERR_MethodTrackerReturn("Record_BarSel"; $_t_oldMethodName)