//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_Mod
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
	//ARRAY TEXT(WS_at_DocumentTemplateClasses;0)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(vTr; WS_l_SelDocTemplateClass; xNext)
	C_TEXT:C284($_t_LetterCodeFind; $_t_oldMethodName; $1; $2; $3; vLetterCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_Mod")
xNext:=0
//WS_at_DocumentTemplateClasses
ARRAY TEXT:C222(WS_at_DocumentTemplateClasses; 5)
WS_at_DocumentTemplateClasses{1}:="Letter Templates"
WS_at_DocumentTemplateClasses{2}:="Report Templates"
WS_at_DocumentTemplateClasses{3}:="eMail Templates"
WS_at_DocumentTemplateClasses{4}:="-"
WS_at_DocumentTemplateClasses{5}:="Others"
If (Count parameters:C259>=1)
	WS_l_SelDocTemplateClass:=Num:C11($1)
Else 
	WS_l_SelDocTemplateClass:=5
End if 
//NG NOTE..January 2007 this method aleady has a $1--the template teype

If (Count parameters:C259>=3)
	$_bo_AutoFind:=($3="TRUE")
	$_t_LetterCodeFind:=$2
End if 

Gen_Mod("View Templates"; "Letters_File"; "Master"; ->[DOCUMENTS:7]; ->vTr; "Letters_Sel"; "Documents"; $_bo_AutoFind; $_t_LetterCodeFind)
If (Records in set:C195("Userset")>0)
	USE SET:C118("Userset")
End if 
FIRST RECORD:C50([DOCUMENTS:7])
vLetterCode:=[DOCUMENTS:7]Document_Code:1
ERR_MethodTrackerReturn("Letters_Mod"; $_t_oldMethodName)