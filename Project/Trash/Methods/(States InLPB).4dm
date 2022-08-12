//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      States_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 08:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	//ARRAY INTEGER(CU_ai_CodeNo;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_LONGINT:C283($_l_NumberofRows; $_l_TablePosition)
	C_TEXT:C284($_t_oldMethodName; vButtDisFST; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("States_InLPB")
//States_InLPB

If ([TABLE_RECORD_STATES:90]State_Code:1#"")
	[TABLE_RECORD_STATES:90]State_Code:1:=Uppercase:C13([TABLE_RECORD_STATES:90]State_Code:1)
	GOTO OBJECT:C206([TABLE_RECORD_STATES:90]Listing_Name:2)
End if 
If (([TABLE_RECORD_STATES:90]Table_number:3>0) & ([TABLE_RECORD_STATES:90]Table_number:3<=Size of array:C274(<>DB_at_TableNames)))
	$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; [TABLE_RECORD_STATES:90]Table_number:3)
	vStatus:=<>DB_at_TableNames{$_l_TablePosition}
Else 
	vStatus:=""
End if 

$_l_NumberofRows:=18
ARRAY TEXT:C222(GEN_at_Identity; $_l_NumberofRows)

If (False:C215)  //BSW 17/02/03 Engineering new reported error 61 so I am retyping these arrays
	//Array Text(GEN_at_Identity;$_l_NumberofRows)
End if 
ARRAY INTEGER:C220(CU_ai_CodeUsed; $_l_NumberofRows)
ARRAY BOOLEAN:C223(CU_abo_CodeUsed; $_l_NumberofRows)
ARRAY INTEGER:C220(CU_ai_CodeNo; $_l_NumberofRows)
GEN_at_Identity{1}:="Credit Check"
CU_ai_CodeNo{1}:=1
GEN_at_Identity{2}:="Sales Ledger"
CU_ai_CodeNo{2}:=2
GEN_at_Identity{3}:="Purchase Ledger"
CU_ai_CodeNo{3}:=3
GEN_at_Identity{4}:="Stock Control"
CU_ai_CodeNo{4}:=4
GEN_at_Identity{5}:="Purchase Orders"
CU_ai_CodeNo{5}:=5
GEN_at_Identity{6}:="Delivery Notes"
CU_ai_CodeNo{6}:=6
GEN_at_Identity{7}:="Authorisation"
CU_ai_CodeNo{7}:=7
GEN_at_Identity{8}:="Acknowledgement"
CU_ai_CodeNo{8}:=8
GEN_at_Identity{9}:="Full Details Form"
CU_ai_CodeNo{9}:=9
GEN_at_Identity{10}:="No Deletions"
CU_ai_CodeNo{10}:=10
GEN_at_Identity{11}:="Warn on Upgrade"
CU_ai_CodeNo{11}:=11
GEN_at_Identity{12}:="Warn on Downgrade"
CU_ai_CodeNo{12}:=12
GEN_at_Identity{13}:="Prevent Downgrade"
CU_ai_CodeNo{13}:=13
GEN_at_Identity{14}:="Prevent Upgrade"
CU_ai_CodeNo{14}:=14
GEN_at_Identity{15}:="Prevent if Stock Allocated"
CU_ai_CodeNo{15}:=15
GEN_at_Identity{16}:="Prevent if Delivered"
CU_ai_CodeNo{16}:=16
GEN_at_Identity{17}:="Prevent if Invoiced"
CU_ai_CodeNo{17}:=17
GEN_at_Identity{18}:="Copy Previous"
CU_ai_CodeNo{18}:=18
Gen_CULPB2(->[TABLE_RECORD_STATES:90]State_Reference:4; $_l_NumberofRows)
SORT ARRAY:C229(GEN_at_Identity; CU_ai_CodeNo; CU_ai_CodeUsed; CU_abo_CodeUsed; >)

vButtDisFST:="I  PMO  FSSSRCADT"
Input_Buttons(->[TABLE_RECORD_STATES:90]; ->vButtDisFST)
ERR_MethodTrackerReturn("States_InLPB"; $_t_oldMethodName)
