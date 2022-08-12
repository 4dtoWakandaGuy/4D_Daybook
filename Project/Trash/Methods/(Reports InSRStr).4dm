//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports_InSRStr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/02/2010 06:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(MCR_al_TableIDs;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(SR_at_Fields;0)
	//ARRAY TEXT(MCR_at_TableNames;0)
	C_LONGINT:C283($_l_FieldsIndex; $_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; $_t_String)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_InSRStr")
//Reports_InSRStr

ARRAY TEXT:C222(MCR_at_TableNames; 0)
ARRAY LONGINT:C221(MCR_al_TableIDs; 0)

COPY ARRAY:C226(<>DB_at_TableNames; MCR_at_TableNames)
COPY ARRAY:C226(<>DB_al_TableNums; MCR_al_TableIDs)
//SORT ARRAY(MCR_at_TableNames;MCR_al_TableIDs)
//<menu number>;<table number>;<field number>;<virtual name>
ARRAY TEXT:C222(SR_at_Fields; 0)

For ($_l_Index; 1; Size of array:C274(MCR_at_TableNames))
	$_t_String:=String:C10($_l_Index)+";"+String:C10(MCR_al_TableIDs{$_l_Index})+";"+"0;"+MCR_at_TableNames{$_l_Index}
	APPEND TO ARRAY:C911(SR_at_Fields; $_t_String)
	//$_l_SizeofArray:=Find in array(
	$_l_SizeofArray:=Find in array:C230(<>DB_al_TableNums; MCR_al_TableIDs{$_l_Index})
	If ($_l_SizeofArray>0)
		For ($_l_FieldsIndex; 1; Size of array:C274(<>SYS_at_2DFieldNames{$_l_SizeofArray}))
			If ($_l_FieldsIndex<=Size of array:C274(<>SYS_al_2DFieldNumbers{$_l_SizeofArray}))
				$_t_String:=String:C10($_l_Index)+";"+String:C10(MCR_al_TableIDs{$_l_Index})+";"+String:C10(<>SYS_al_2DFieldNumbers{$_l_SizeofArray}{$_l_FieldsIndex})+";"+<>SYS_at_2DFieldNames{$_l_SizeofArray}{$_l_FieldsIndex}
				APPEND TO ARRAY:C911(SR_at_Fields; $_t_String)
			End if 
		End for 
	End if 
End for 
SET TABLE TITLES:C601(<>DB_at_TableNames; <>DB_al_TableNums)

//$_l_SizeofArrayesult:=SR Structure ($1;"SR_at_Fields";64+256)


//End if
ERR_MethodTrackerReturn("Reports_InSRStr"; $_t_oldMethodName)
