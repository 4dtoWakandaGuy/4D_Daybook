If (False:C215)
	//object Name: [USER]User_In.Button17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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
	//ARRAY TEXT(EW_at_BKTables;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	C_LONGINT:C283(DM_l_ModelSequence)
	C_TEXT:C284($_t_oldMethodName; $_t_StoreName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button17"; Form event code:C388)

$_t_StoreName:=""
$_t_StoreName:=Request:C163("Name of store:")
If (OK=1) & ($_t_StoreName#"")
	If (Find in array:C230(DM_at_BKModelNames; $_t_StoreName)>0)
		Gen_Alert("That store name is already in use.")
	Else 
		INSERT IN ARRAY:C227(DM_at_BKModelNames; 1)
		DM_at_BKModelNames{1}:=$_t_StoreName
		INSERT IN ARRAY:C227(DM_al_BKModelIDS; 1)
		DM_al_BKModelIDS{1}:=AA_GetNextID(->DM_l_ModelSequence)
		SORT ARRAY:C229(DM_at_BKModelNames; DM_al_BKModelIDS)
		DM_at_BKModelNames:=Find in array:C230(DM_at_BKModelNames; $_t_StoreName)
		EW_at_BKTables:=1
		EW_at_ExportTableNames{1}:="Select a table"
		EW_al_ExportTableNumbers{1}:=0
		EW_BKFieldMapArrays(0; ""; "DB")
		EW_BKFieldMapArrays(0; ""; "BK")
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button17"; $_t_oldMethodName)
