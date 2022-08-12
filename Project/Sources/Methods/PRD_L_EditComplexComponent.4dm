//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_l_EditComplexComponent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/06/2010 11:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_UsedSectionIDS;0)
	C_LONGINT:C283($_l_ComponentID; $_l_Index; $1; $2; PRD_al_CodeFormatID)
	C_POINTER:C301($_ptr_UsedSections; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_l_EditComplexComponent")
If (Count parameters:C259>=3)
	$_l_ComponentID:=$1
	PRD_al_CodeFormatID:=$2
	$_ptr_UsedSections:=$3
	ARRAY LONGINT:C221(PRD_al_UsedSectionIDS; 0)
	For ($_l_Index; 1; Size of array:C274($3->))
		APPEND TO ARRAY:C911(PRD_al_UsedSectionIDS; $3->)
	End for 
	
	//`Open window((Screen width/2);(Screen height/2);(Screen width/2);(Screen height/2);34)
	
	Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 8)
	
	FORM SET INPUT:C55([COMPONENTS:86]; "EDIT_COMPONENT")
	If ($_l_ComponentID#0)
		READ WRITE:C146([COMPONENTS:86])
		QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=$1)
		MODIFY RECORD:C57([COMPONENTS:86]; *)
	Else 
		ADD RECORD:C56([COMPONENTS:86]; *)
		
		
	End if 
	CLOSE WINDOW:C154
End if 
ERR_MethodTrackerReturn("PRD_l_EditComplexComponent"; $_t_oldMethodName)
