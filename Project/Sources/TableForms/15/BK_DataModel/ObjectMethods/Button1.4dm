If (False:C215)
	//object Name: [USER]BK_DataModel.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(BK_al_ADBFIELDNUM;0)
	//ARRAY LONGINT(BK_al_aDBTableNum;0)
	//ARRAY LONGINT(BK_al_MapRecID;0)
	//ARRAY LONGINT(BK_al_PsuedoNumber;0)
	//ARRAY LONGINT(BK_al_SortNumber;0)
	//ARRAY TEXT(BK_at_BKFieldName;0)
	//ARRAY TEXT(BK_at_DBFieldName;0)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Button1"; Form event code:C388)
Gen_Alert("If you add a field the name must EXACTLY match the business kit field name")
$_t_FieldName:=Gen_Request("Enter Field Name")
If ($_t_FieldName#"")
	INSERT IN ARRAY:C227(BK_at_BKFieldName; Size of array:C274(BK_at_BKFieldName)+1; 1)
	BK_at_BKFieldName{Size of array:C274(BK_at_BKFieldName)}:=$_t_FieldName
	INSERT IN ARRAY:C227(BK_al_aDBTableNum; Size of array:C274(BK_al_aDBTableNum)+1; 1)
	INSERT IN ARRAY:C227(BK_al_ADBFIELDNUM; Size of array:C274(BK_al_ADBFIELDNUM)+1; 1)
	INSERT IN ARRAY:C227(BK_at_DBFieldName; Size of array:C274(BK_at_DBFieldName)+1; 1)
	BK_at_DBFieldName{Size of array:C274(BK_at_DBFieldName)}:="Unknown"
	INSERT IN ARRAY:C227(BK_al_PsuedoNumber; Size of array:C274(BK_al_PsuedoNumber)+1; 1)
	INSERT IN ARRAY:C227(BK_al_SortNumber; Size of array:C274(BK_al_SortNumber)+1; 1)
	INSERT IN ARRAY:C227(BK_al_MapRecID; Size of array:C274(BK_al_MapRecID)+1; 1)
	BK_al_PsuedoNumber{Size of array:C274(BK_al_PsuedoNumber)}:=-(Size of array:C274(BK_al_PsuedoNumber))
	//if modified they will be plus 1000
	BK_al_SortNumber{Size of array:C274(BK_al_PsuedoNumber)}:=(BK_al_SortNumber{Size of array:C274(BK_al_PsuedoNumber)-1})+1
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Button1"; $_t_oldMethodName)
