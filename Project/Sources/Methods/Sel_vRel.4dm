//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_vRel
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
	C_LONGINT:C283($_l_CurrentTable; $_l_Index; $_l_RecordsInSelection; $_l_SearchField; $_l_SearchTable; $_l_Type; $3; $Currentfield)
	C_POINTER:C301($_ptr_Field; $_ptr_Table; $1; $2; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_vRel")

//$1=field in table to return selection
//$2=field in table to search for related
//$3=1 $1 is the one table 2 if$1 is the many
//$4=Pointer to The value to seach for
If (Count parameters:C259>=4)
	$_l_CurrentTable:=Table:C252($1)
	$Currentfield:=Field:C253($1)
	$_l_SearchTable:=Table:C252($2)
	$_l_SearchField:=Field:C253($2)
	
	Case of 
		: ($3=1)
			QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xManyTableFieldNum:4=$_l_SearchField; *)
			QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableNum:3=$_l_SearchTable; *)
			$_ptr_Field:=Field:C253($_l_SearchTable; $_l_SearchField)
			$_l_Type:=Type:C295($_ptr_Field->)
			Case of 
				: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
					QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableSTRRef:8=$4->; *)
				Else 
					QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xManyTableLONGref:7=$4->; *)
			End case 
		: ($3=2)
			QUERY:C277([xOtherRelations:138]; [xOtherRelations:138]xOneTableFieldNum:2=$_l_SearchField; *)
			QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableNUm:1=$_l_SearchTable; *)
			$_ptr_Field:=Field:C253($_l_SearchTable; $_l_SearchField)
			$_l_Type:=Type:C295($_ptr_Field->)
			Case of 
				: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
					QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableSTRreference:6=$4->; *)
				Else 
					QUERY:C277([xOtherRelations:138];  & ; [xOtherRelations:138]xOneTableLONGref:5=$4->; *)
			End case 
			
			
	End case 
	If (Records in selection:C76([xOtherRelations:138])>0)
		$_l_RecordsInSelection:=Records in selection:C76([xOtherRelations:138])
		$_ptr_Table:=Table:C252($_l_CurrentTable)
		CREATE EMPTY SET:C140($_ptr_Table->; "$TEMP")
		
		For ($_l_Index; 1; $_l_RecordsInSelection)
			
			Case of 
				: ($3=1)
					
					$_l_Type:=Type:C295($1->)
					Case of 
						: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
							
							QUERY:C277($_ptr_Table->; $1->=[xOtherRelations:138]xOneTableSTRreference:6)
						Else 
							QUERY:C277($_ptr_Table->; $1->=[xOtherRelations:138]xOneTableLONGref:5)
					End case 
				: ($3=2)
					$_l_Type:=Type:C295($1->)
					Case of 
						: ($_l_Type=Is alpha field:K8:1) | ($_l_Type=Is text:K8:3)
							
							QUERY:C277($_ptr_Table->; $1->=[xOtherRelations:138]xManyTableSTRRef:8)
						Else 
							QUERY:C277($_ptr_Table->; $1->=[xOtherRelations:138]xManyTableLONGref:7)
					End case 
			End case 
			ADD TO SET:C119($_ptr_Table->; "$TEMP")
		End for 
		
	End if 
End if 
ERR_MethodTrackerReturn("Sel_vRel"; $_t_oldMethodName)
