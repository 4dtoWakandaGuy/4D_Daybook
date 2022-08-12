//%attributes = {}
If (False:C215)
	//Project Method Name:      Contact_List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Con_at_ContactDataDisplay;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283($_l_SelectedRow; $i; bd1)
	C_POINTER:C301($_Ptr_FIeld)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contact_List2")
//Contact_List2
Array_LCx(Records in selection:C76([CONTACTS:1]))
If (Count parameters:C259>=1)
	$_l_SelectedRow:=$1
Else 
	$_l_SelectedRow:=<>Con_at_ContactDataDisplay
End if 
Case of 
	: ($_l_SelectedRow<=1)
		$_Ptr_FIeld:=->[CONTACTS:1]Contact_Code:2
	: ($_l_SelectedRow=2)
		$_Ptr_FIeld:=->[CONTACTS:1]Title:3
	: ($_l_SelectedRow=3)
		$_Ptr_FIeld:=->[CONTACTS:1]Job_Title:6
	: ($_l_SelectedRow=4)
		$_Ptr_FIeld:=->[CONTACTS:1]Dept:8
	: ($_l_SelectedRow=5)
		$_Ptr_FIeld:=->[CONTACTS:1]Extn:9
	: ($_l_SelectedRow=6)
		$_Ptr_FIeld:=->[CONTACTS:1]Role:11
	: ($_l_SelectedRow=7)
		$_Ptr_FIeld:=->[CONTACTS:1]Status:14
	: ($_l_SelectedRow=8)
		$_Ptr_FIeld:=->[CONTACTS:1]Contact_Type:15
	: ($_l_SelectedRow=9)
		$_Ptr_FIeld:=->[CONTACTS:1]Source:16
	: ($_l_SelectedRow=10)
		$_Ptr_FIeld:=->[COMPANIES:2]Company_Name:2
		SET AUTOMATIC RELATIONS:C310(True:C214; False:C215)
End case 
SELECTION TO ARRAY:C260([CONTACTS:1]Forename:4; GEN_at_RecordCode; [CONTACTS:1]Surname:5; GEN_at_Name; $_Ptr_FIeld->; GEN_at_Identity; [CONTACTS:1]Contact_Code:2; SVS_at_PreviewEvent)
SET AUTOMATIC RELATIONS:C310(False:C215; False:C215)

//MESSAGES OFF
//FIRST RECORD([CONTACTS])
//$i:=1
//While (Not(End selection([CONTACTS])))
// GEN_at_Identity{$i}:=[CONTACTS]Forename
// GEN_at_Name{$i}:=[CONTACTS]Surname
// GEN_at_RecordCode{$i}:=[CONTACTS]Contact Code
// NEXT RECORD([CONTACTS])
//  $i:=$i+1
//End while
//MESSAGES ON

SORT ARRAY:C229(GEN_at_Name; GEN_at_Identity; GEN_at_RecordCode; SVS_at_PreviewEvent; >)
bd1:=Size of array:C274(GEN_at_Name)
Array_LCStart
SVS_at_PreviewEvent:=1
ERR_MethodTrackerReturn("Contact_List2"; $_t_oldMethodName)