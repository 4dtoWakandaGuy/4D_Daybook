//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_TableArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 15:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(EW_al_ExportTableNumbers;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	C_BOOLEAN:C305($_bo_invisible)
	C_LONGINT:C283($_l_CurrentRow; $_l_TableCount; $_l_TableIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_TableArrays")
//EW_TableArrays
// 7/10/02 pb
$_l_TableCount:=Get last table number:C254
//ARRAY TEXT(atTableNumbers;0)
//TRACE
ARRAY TEXT:C222(DM_at_BKModelNames; 4)
ARRAY LONGINT:C221(DM_al_BKModelIDS; 4)
DM_at_BKModelNames{1}:="Select a Table"
DM_at_BKModelNames{2}:="Catalogues"
DM_at_BKModelNames{3}:="Contacts"
DM_at_BKModelNames{4}:="Products"
DM_al_BKModelIDS{1}:=0
DM_al_BKModelIDS{2}:=Table:C252(->[CATALOGUE:108])
DM_al_BKModelIDS{3}:=Table:C252(->[CONTACTS:1])
DM_al_BKModelIDS{4}:=Table:C252(->[PRODUCTS:9])

//If (False)  ` 22/08/03 pb
ARRAY TEXT:C222(EW_at_ExportTableNames; $_l_TableCount)
ARRAY LONGINT:C221(EW_al_ExportTableNumbers; $_l_TableCount)
$_l_CurrentRow:=0
For ($_l_TableIndex; 1; $_l_TableCount)
	If (Is table number valid:C999($_l_TableIndex))
		GET TABLE PROPERTIES:C687($_l_TableIndex; $_bo_invisible)
		If ($_bo_invisible=False:C215)
			$_l_CurrentRow:=$_l_CurrentRow+1
			EW_at_ExportTableNames{$_l_CurrentRow}:=Table name:C256($_l_TableIndex)
			EW_al_ExportTableNumbers{$_l_CurrentRow}:=$_l_TableIndex
		End if 
	End if 
End for 
ARRAY TEXT:C222(EW_at_ExportTableNames; $_l_CurrentRow)
ARRAY LONGINT:C221(EW_al_ExportTableNumbers; $_l_CurrentRow)
SORT ARRAY:C229(EW_at_ExportTableNames; EW_al_ExportTableNumbers)
INSERT IN ARRAY:C227(EW_at_ExportTableNames; 1)
INSERT IN ARRAY:C227(EW_al_ExportTableNumbers; 1)
EW_at_ExportTableNames{1}:="Select a Table"
//End if
ERR_MethodTrackerReturn("EW_TableArrays"; $_t_oldMethodName)