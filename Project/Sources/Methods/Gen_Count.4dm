//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Count
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo; vSNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; vRec; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Count")
//Gen_Count
vNo:=Records in selection:C76($1->)
vSNo:=Records in set:C195("Userset")
If (vSNo>0)
	COPY NAMED SELECTION:C331($1->; $2)
	USE SET:C118("Userset")
End if 
vRec:=Char:C90(13)
vText:="Number in List: "+String:C10(vNo)+vRec+"Number Highlighted: "+String:C10(vSNo)+vRec+vRec
ERR_MethodTrackerReturn("Gen_Count"; $_t_oldMethodName)