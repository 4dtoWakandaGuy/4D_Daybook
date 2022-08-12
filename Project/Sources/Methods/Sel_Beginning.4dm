//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_Beginning
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Messages; $1; vSIS)
	C_LONGINT:C283(SRCH_l_And; SRCH_l_Not; SRCH_l_or; vButt; vPage)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; VSELPREV; vTitle11; vTitle12; vTitle13)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_Beginning")
//Sel Begining
If (Count parameters:C259>=1)
	$_bo_Messages:=$1
Else 
	$_bo_Messages:=False:C215
End if 


If (vSIS=False:C215)
	If (Count parameters:C259>=2)
		CREATE SET:C116($2->; "Before")
	Else 
		Gen_Alert("This have been modified Sel_Beginning now needs 2 parameters")
	End if 
	If ($_bo_Messages)
		//MESSAGE("Using previous Search Set to search in selection "+String(Records in selection))
	End if 
End if 
If (Count parameters:C259>=2)
	CREATE EMPTY SET:C140($2->; "Big One")
Else 
	Gen_Alert("This have been modified Sel_Beginning now needs 2 parameters")
End if 

vButt:=1
vPage:=0
SRCH_l_And:=1
SRCH_l_or:=0
SRCH_l_Not:=0
vTitle11:=""
vTitle12:=""  //The Criteria Save name
If (vSelPrev="•FSC")
	If (Gen_Option)
		vSelPrev:=""
	End if 
Else 
	vTitle13:=""  //The Criteria Save Variables List
End if 
ERR_MethodTrackerReturn("Sel_Beginning"; $_t_oldMethodName)
