//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_LoadAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/06/2012 20:55
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
	C_LONGINT:C283($_l_CurrentSelected; $_l_offset; $_l_SizeofArray; DOC_l_DOCUMENTOWNER)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_LoadAccess")
If (Count parameters:C259>=1)
	$_l_CurrentSelected:=0
	ARRAY LONGINT:C221(DOC_Al_GroupsAccess; 0)
	ARRAY LONGINT:C221(DOC_al_GroupAccessLevel; 0)
	ARRAY LONGINT:C221(DOC_al_PersonAccess; 0)
	ARRAY LONGINT:C221(DOC_al_PersonAccessLevel; 0)
	If ([DOCUMENTS:7]Document_Code:1#$1)
		COPY NAMED SELECTION:C331([DOCUMENTS:7]; "$Temp")
		$_l_CurrentSelected:=Selected record number:C246([DOCUMENTS:7])
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$1)
	End if 
	$_l_offset:=0
	
	If (BLOB size:C605([DOCUMENTS:7]x_Access_Rights:33)>0)
		BLOB TO VARIABLE:C533([DOCUMENTS:7]x_Access_Rights:33; DOC_l_DOCUMENTOWNER; $_l_offset)
		If (BLOB size:C605([DOCUMENTS:7]x_Access_Rights:33)>$_l_offset)
			
			BLOB TO VARIABLE:C533([DOCUMENTS:7]x_Access_Rights:33; DOC_Al_GroupsAccess; $_l_offset)
			If (BLOB size:C605([DOCUMENTS:7]x_Access_Rights:33)>$_l_offset)
				BLOB TO VARIABLE:C533([DOCUMENTS:7]x_Access_Rights:33; DOC_al_GroupAccessLevel; $_l_offset)
				If (BLOB size:C605([DOCUMENTS:7]x_Access_Rights:33)>$_l_offset)
					BLOB TO VARIABLE:C533([DOCUMENTS:7]x_Access_Rights:33; DOC_al_PersonAccess; $_l_offset)
					If (BLOB size:C605([DOCUMENTS:7]x_Access_Rights:33)>$_l_offset)
						BLOB TO VARIABLE:C533([DOCUMENTS:7]x_Access_Rights:33; DOC_al_PersonAccessLevel; $_l_offset)
					End if 
				End if 
			End if 
		End if 
	End if 
	$_l_SizeofArray:=Size of array:C274(DOC_Al_GroupsAccess)
	ARRAY LONGINT:C221(DOC_Al_GroupsAccess; $_l_SizeofArray)
	ARRAY LONGINT:C221(DOC_al_GroupAccessLevel; $_l_SizeofArray)
	ARRAY LONGINT:C221(DOC_al_PersonAccess; $_l_SizeofArray)
	ARRAY LONGINT:C221(DOC_al_PersonAccessLevel; $_l_SizeofArray)
	If ($_l_CurrentSelected>0)
		USE NAMED SELECTION:C332("$temp")
		GOTO SELECTED RECORD:C245([DOCUMENTS:7]; $_l_CurrentSelected)
	End if 
	
End if 
ERR_MethodTrackerReturn("DOC_LoadAccess"; $_t_oldMethodName)