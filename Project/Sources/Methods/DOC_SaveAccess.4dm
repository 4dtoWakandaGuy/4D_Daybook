//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_SaveAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/06/2012 11:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	C_LONGINT:C283($_l_CurrentSelected; $_l_offset; DOC_l_DOCUMENTOWNER)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_SaveAccess")

If (Count parameters:C259>=1)
	$_l_CurrentSelected:=0
	If ([DOCUMENTS:7]Document_Code:1#$1)
		COPY NAMED SELECTION:C331([DOCUMENTS:7]; "$Temp")
		$_l_CurrentSelected:=Selected record number:C246([DOCUMENTS:7])
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$1)
	End if 
	$_l_offset:=0
	SET BLOB SIZE:C606([DOCUMENTS:7]x_Access_Rights:33; 0)
	VARIABLE TO BLOB:C532(DOC_l_DOCUMENTOWNER; [DOCUMENTS:7]x_Access_Rights:33; *)
	
	VARIABLE TO BLOB:C532(DOC_Al_GroupsAccess; [DOCUMENTS:7]x_Access_Rights:33; *)
	
	VARIABLE TO BLOB:C532(DOC_al_GroupAccessLevel; [DOCUMENTS:7]x_Access_Rights:33; *)
	VARIABLE TO BLOB:C532(DOC_al_PersonAccess; [DOCUMENTS:7]x_Access_Rights:33; *)
	VARIABLE TO BLOB:C532(DOC_al_PersonAccessLevel; [DOCUMENTS:7]x_Access_Rights:33; *)
	VARIABLE TO BLOB:C532(DOC_al_PersonAccessLevel; [DOCUMENTS:7]x_Access_Rights:33; *)
	SAVE RECORD:C53([DOCUMENTS:7])
	
	If ($_l_CurrentSelected>0)
		USE NAMED SELECTION:C332("$temp")
		GOTO SELECTED RECORD:C245([DOCUMENTS:7]; $_l_CurrentSelected)
	End if 
	
End if 
ERR_MethodTrackerReturn("DOC_SaveAccess"; $_t_oldMethodName)