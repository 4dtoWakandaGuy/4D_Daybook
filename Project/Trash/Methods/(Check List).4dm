//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_FieldType; $_l_FindReferencePosition; $_l_OK; $_l_WindowReferenceRow; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Table; $1; $2)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_FirstCharacter; $_t_oldMethodName; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check List")
//Check List

$_ptr_Table:=Table:C252(Table:C252($2))
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:="NC"
If (Records in selection:C76($_ptr_Table->)>1)
	REDUCE SELECTION:C351($_ptr_Table->; 2500)
End if 
$_t_FirstCharacter:=Substring:C12($3; 1; 1)
Open_Rel_Window("Select a"+("n"*Num:C11(($_t_FirstCharacter="a") | ($_t_FirstCharacter="e") | ($_t_FirstCharacter="o") | ($_t_FirstCharacter="i") | ($_t_FirstCharacter="u")))+" "+$3)
Array_LCx(Records in selection:C76($_ptr_Table->))
GET FIELD PROPERTIES:C258($2; $_l_FieldType)
If (($_l_FieldType=0) | ($_l_FieldType=2))
	SELECTION TO ARRAY:C260($1->; GEN_at_Identity; $2->; GEN_at_Name)
Else 
	$_l_FieldType:=1
	FIRST RECORD:C50($_ptr_Table->)
	While (Not:C34(End selection:C36($_ptr_Table->)))
		GEN_at_Identity{$_l_FieldType}:=$1->
		GEN_at_Name{$_l_FieldType}:=String:C10($2->)
		$_l_FieldType:=$_l_FieldType+1
		NEXT RECORD:C51($_ptr_Table->)
	End while 
End if 
DIALOG:C40([COMPANIES:2]; "dRelate List")
CLOSE WINDOW:C154
$_l_OK:=OK
OK:=1
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 

WS_KeepFocus

If ($_l_OK=1)
	QUERY:C277($_ptr_Table->; $1->=GEN_at_Identity{GEN_at_Identity})
Else 
	REDUCE SELECTION:C351($_ptr_Table->; 0)
End if 
Array_LCx(0)
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Check List"; $_t_oldMethodName)