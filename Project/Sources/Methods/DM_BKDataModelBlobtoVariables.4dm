//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_BKDataModelBlobtoVariables
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
	//ARRAY LONGINT(BK_al_BKModelIDS;0)
	//ARRAY LONGINT(DM_al_BKAssModel1IDS;0)
	//ARRAY LONGINT(DM_al_BKAssModel2IDS;0)
	//ARRAY LONGINT(DM_al_BKDataDefaults;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	C_LONGINT:C283($_l_offset; $_l_SizeofArray; DM_l_BKDataDefaults)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_BKDataModelBlobtoVariables")

ARRAY TEXT:C222(DM_at_BKModelNames; 0)
ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; 0)
ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; 0)
ARRAY LONGINT:C221(DM_al_BKDataDefaults; 0)
$_l_offset:=0
If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_BKModelNames; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_BKModelIDS; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_BKAssModel1IDS; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_BKAssModel2IDS; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_BKDataDefaults; $_l_offset)
				End if 
			End if 
		End if 
	End if 
End if 
$_l_SizeofArray:=Size of array:C274(DM_at_BKModelNames)
ARRAY TEXT:C222(DM_at_BKModelNames; $_l_SizeofArray)
ARRAY LONGINT:C221(BK_al_BKModelIDS; $_l_SizeofArray)
ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; $_l_SizeofArray)
ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; $_l_SizeofArray)
ARRAY LONGINT:C221(DM_al_BKDataDefaults; $_l_SizeofArray)
ERR_MethodTrackerReturn("DM_BKDataModelBlobtoVariables"; $_t_oldMethodName)