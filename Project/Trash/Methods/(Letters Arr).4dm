//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters Arr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_LetterClass; 0)
	//ARRAY LONGINT(DOC_al_DocumentTypes;0)
	//ARRAY TEXT(DOC_at_Documenttype;0)
	//ARRAY TEXT(DOC_at_Documenttypes;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters Arr")
Array_LCx(Records in selection:C76([DOCUMENTS:7]))
ARRAY LONGINT:C221($_al_LetterClass; 0)
ARRAY TEXT:C222(DOC_at_Documenttype; 0)
SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; GEN_at_Identity; [DOCUMENTS:7]Heading:2; GEN_at_Name; [DOCUMENTS:7]Document_Class:14; $_al_LetterClass)
ARRAY TEXT:C222(DOC_at_Documenttype; Size of array:C274($_al_LetterClass))
ARRAY TEXT:C222(DOC_at_Documenttypes; 5)
ARRAY LONGINT:C221(DOC_al_DocumentTypes; 5)
DOC_al_DocumentTypes{1}:=4D Write Letter
DOC_at_Documenttypes{1}:="Letters"
DOC_al_DocumentTypes{2}:=4D Write Letter Template
DOC_at_Documenttypes{2}:="Letter Templates"
DOC_al_DocumentTypes{3}:=4D Write Letter Template
DOC_at_Documenttypes{3}:="Letter Templates"
DOC_al_DocumentTypes{4}:=Text Email
DOC_at_Documenttypes{4}:="Emails"
DOC_al_DocumentTypes{5}:=Text Email Template
DOC_at_Documenttypes{5}:="Email Templates"
For ($_l_Index; 1; Size of array:C274($_al_LetterClass))
	Case of 
		: ($_al_LetterClass{$_l_Index}=4D Write Email)
			DOC_at_Documenttype{$_l_Index}:="HTML Email"
		: ($_al_LetterClass{$_l_Index}=4D Write Email Template)
			DOC_at_Documenttype{$_l_Index}:="HTML Email Template"
		: ($_al_LetterClass{$_l_Index}=4D Write Letter Template)
			DOC_at_Documenttype{$_l_Index}:="Letter template"
		: ($_al_LetterClass{$_l_Index}=4D Write Letter Template)
			DOC_at_Documenttype{$_l_Index}:="Letter template"
		: ($_al_LetterClass{$_l_Index}=4D Write Report)
			DOC_at_Documenttype{$_l_Index}:="Report"
		: ($_al_LetterClass{$_l_Index}=4D Write Report)
			DOC_at_Documenttype{$_l_Index}:="Report Template"
		: ($_al_LetterClass{$_l_Index}=Text Email)
			DOC_at_Documenttype{$_l_Index}:="Email"
		: ($_al_LetterClass{$_l_Index}=Text Email Template)
			DOC_at_Documenttype{$_l_Index}:="Email Template"
	End case 
End for 

//FIRST RECORD([DOCUMENTS])
//$_l_Index:=1
//While (Not(End selection([DOCUMENTS])))
// GEN_at_Identity{$_l_Index}:=[DOCUMENTS]Document Code
//  GEN_at_Name{$_l_Index}:=Substring([DOCUMENTS]Heading;1;60)
// $_l_Index:=$_l_Index+1
// NEXT RECORD([DOCUMENTS])
//End while
SORT ARRAY:C229(GEN_at_Identity; GEN_at_Name; DOC_at_Documenttype; >)
ERR_MethodTrackerReturn("Letters Arr"; $_t_oldMethodName)