//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_loadset
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
	ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
	ARRAY LONGINT:C221($_al_ValidNumbers; 0)
	//ARRAY LONGINT(QV_al_RecordNumbers;0)
	C_LONGINT:C283($_l_GroupID; $_l_Index; $_l_offset; $_l_QualityID; $_l_ValidNumberRow; $1; $4; $5; $6)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_REAL:C285($_r_Level)
	C_TEXT:C284($_t_oldMethodName; $_t_Year; $2; $3; $7; t_QVTEMPADD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_loadset")
//this method takes a set saved in a blob and loads it to current selection
//$1 is pointer to the table
//$2 set name to create

ARRAY LONGINT:C221(QV_al_RecordNumbers; 0)
$_l_offset:=0
BLOB TO VARIABLE:C533([USER_SETS:105]SET_BLOB:4; QV_al_RecordNumbers; $_l_offset)
ARRAY LONGINT:C221($_al_ValidNumbers; 0)

For ($_l_Index; 1; Size of array:C274(QV_al_RecordNumbers))
	If (QV_al_RecordNumbers{$_l_Index}>=0)
		$_l_ValidNumberRow:=Find in array:C230($_al_ValidNumbers; QV_al_RecordNumbers{$_l_Index})
		If ($_l_ValidNumberRow<0)
			APPEND TO ARRAY:C911($_al_ValidNumbers; QV_al_RecordNumbers{$_l_Index})
		End if 
	End if 
End for 

$_Ptr_Table:=Table:C252($1)
If (Size of array:C274($_al_ValidNumbers)>0)
	CREATE SET FROM ARRAY:C641($_Ptr_Table->; $_al_ValidNumbers; $2)
Else 
	CREATE EMPTY SET:C140($_Ptr_Table->; $2)
End if 

t_QVTEMPADD:=""
$_l_GroupID:=0
$_l_QualityID:=0
$_r_Level:=0
$_t_Year:=""

If (Count parameters:C259>=3)
	
	t_QVTEMPADD:=$3
	If (Count parameters:C259>=4)
		$_l_GroupID:=$4
		If (Count parameters:C259>=5)
			$_l_QualityID:=$5
			If (Count parameters:C259>=6)
				$_r_Level:=$6
			End if 
			If (Count parameters:C259>=7)
				$_t_Year:=$7
			End if 
		End if 
	End if 
	
	$_ptr_Field:=QV_GetIdField($1)
	If (Not:C34(Is nil pointer:C315($_ptr_Field)))
		
		CREATE EMPTY SET:C140($_Ptr_Table->; "Match")
		CREATE EMPTY SET:C140($_Ptr_Table->; "match2")
		CREATE EMPTY SET:C140($_Ptr_Table->; "filtered")
		USE SET:C118(t_QVTEMPADD)  //bsw we must have it here
		ARRAY LONGINT:C221($_al_OneTableRecordIDS; 0)
		SELECTION TO ARRAY:C260($_ptr_Field->; $_al_OneTableRecordIDS)
		
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=$1; *)
		QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableFieldNum:12=Field:C253($_ptr_Field); *)
		
		If ($_l_GroupID>0)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityGroupID:15=$_l_GroupID; *)
		End if 
		
		If ($_l_QualityID>0)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityID:14=$_l_QualityID; *)
		End if 
		
		If ($_r_Level>0)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Information_Level:4=$_r_Level; *)
		End if 
		
		If ($_t_Year#"")
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]Year:5=Num:C11($_t_Year); *)
		End if 
		
		QUERY:C277([INFORMATION:55])
		
		CREATE SET:C116([INFORMATION:55]; "Match")
		
		For ($_l_Index; 1; Size of array:C274($_al_OneTableRecordIDS))
			
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelateTableRecordNumber:13=$_al_OneTableRecordIDS{$_l_Index})
			CREATE SET:C116([INFORMATION:55]; "match2")
			INTERSECTION:C121("match"; "match2"; "match2")
			USE SET:C118("match2")
			If (Records in selection:C76([INFORMATION:55])>0)
				If (Is in set:C273("Match"))
					QUERY:C277($_Ptr_Table->; $_ptr_Field->=[INFORMATION:55]RelateTableRecordNumber:13)
					If (Records in selection:C76($_Ptr_Table->)=1)
						ADD TO SET:C119($_Ptr_Table->; "filtered")
					End if 
				End if 
			End if 
			
		End for 
		
		USE SET:C118("filtered")
		CREATE SET:C116($_Ptr_Table->; $2)
		CLEAR SET:C117("filtered")
		CLEAR SET:C117("Match")
		CLEAR SET:C117("match2")
	End if 
	
End if 
ERR_MethodTrackerReturn("QV_loadset"; $_t_oldMethodName)
