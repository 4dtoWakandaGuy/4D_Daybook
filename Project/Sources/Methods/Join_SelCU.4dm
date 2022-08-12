//%attributes = {}
If (False:C215)
	//Project Method Name:      Join_SelCU
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
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_CodeUsesCodes; 0)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection; $_l_SizeofArray)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Join_SelCU")

$_l_RecordsinSelection:=Records in selection:C76([CODE_USES:91])
If ($_l_RecordsinSelection>1)
	If ($_l_RecordsinSelection<256)
		ARRAY TEXT:C222($_at_CodeUsesCodes; Records in selection:C76([CODE_USES:91]))
		SELECTION TO ARRAY:C260([CODE_USES:91]Code:1; $_at_CodeUsesCodes)
		ARRAY TEXT:C222($_at_Codes; 0)
		ARRAY TEXT:C222($_at_Codes; Size of array:C274($_at_CodeUsesCodes))
		For ($_l_Index; 1; Size of array:C274($_at_CodeUsesCodes))
			$_at_Codes{$_l_Index}:=Substring:C12($_at_CodeUsesCodes{$_l_Index}; 4; Length:C16($_at_CodeUsesCodes{$_l_Index}))
		End for 
		If (Size of array:C274($_at_CodeUsesCodes)>0)
			QUERY WITH ARRAY:C644($2->; $_at_Codes)
			If (False:C215)
				QUERY:C277($1->; $2->=Substring:C12($_at_CodeUsesCodes{1}; 4; Length:C16($_at_CodeUsesCodes{1})); *)
				If (Size of array:C274($_at_CodeUsesCodes)>1)
					$_l_Index:=2
					$_l_SizeofArray:=Size of array:C274($_at_CodeUsesCodes)
					While ($_l_Index<$_l_SizeofArray)
						QUERY:C277($1->;  | ; $2->=Substring:C12($_at_CodeUsesCodes{$_l_Index}; 4; Length:C16($_at_CodeUsesCodes{$_l_Index})); *)
						$_l_Index:=$_l_Index+1
					End while 
					QUERY:C277($1->;  | ; $2->=Substring:C12($_at_CodeUsesCodes{$_l_SizeofArray}; 4; Length:C16($_at_CodeUsesCodes{$_l_SizeofArray})))
				Else 
					QUERY:C277($1->)
				End if 
			End if 
		Else 
			REDUCE SELECTION:C351($1->; 0)
		End if 
	Else 
		//  JOIN([code uses];$1»)
		CREATE EMPTY SET:C140($1->; "Master")
		CREATE SET:C116([CODE_USES:91]; "Extra")
		REDUCE SELECTION:C351([CODE_USES:91]; 255)
		CREATE SET:C116([CODE_USES:91]; "Extra2")
		DIFFERENCE:C122("Extra"; "Extra2"; "Extra")
		While (Records in selection:C76([CODE_USES:91])>0)
			ARRAY TEXT:C222($_at_CodeUsesCodes; Records in selection:C76([CODE_USES:91]))
			SELECTION TO ARRAY:C260([CODE_USES:91]Code:1; $_at_CodeUsesCodes)
			If (Size of array:C274($_at_CodeUsesCodes)>0)
				QUERY:C277($1->; $2->=Substring:C12($_at_CodeUsesCodes{1}; 4; Length:C16($_at_CodeUsesCodes{1})); *)
				If (Size of array:C274($_at_CodeUsesCodes)>1)
					$_l_Index:=2
					$_l_SizeofArray:=Size of array:C274($_at_CodeUsesCodes)
					While ($_l_Index<$_l_SizeofArray)
						QUERY:C277($1->;  | ; $2->=Substring:C12($_at_CodeUsesCodes{$_l_Index}; 4; Length:C16($_at_CodeUsesCodes{$_l_Index})); *)
						$_l_Index:=$_l_Index+1
					End while 
					QUERY:C277($1->;  | ; $2->=Substring:C12($_at_CodeUsesCodes{$_l_SizeofArray}; 4; Length:C16($_at_CodeUsesCodes{$_l_SizeofArray})))
				Else 
					QUERY:C277($1->)
				End if 
			Else 
				REDUCE SELECTION:C351($1->; 0)
			End if 
			
			CREATE SET:C116($1->; "Extra3")
			UNION:C120("Master"; "Extra3"; "Master")
			USE SET:C118("Extra")
			REDUCE SELECTION:C351([CODE_USES:91]; 255)
			CREATE SET:C116([CODE_USES:91]; "Extra2")
			DIFFERENCE:C122("Extra"; "Extra2"; "Extra")
			USE SET:C118("Extra2")
		End while 
		USE SET:C118("Master")
		CLEAR SET:C117("Extra")
		CLEAR SET:C117("Extra2")
		CLEAR SET:C117("Extra3")
	End if 
Else 
	QUERY:C277($1->; $2->=Substring:C12([CODE_USES:91]Code:1; 4; Length:C16([CODE_USES:91]Code:1)))
End if 
ERR_MethodTrackerReturn("Join_SelCU"; $_t_oldMethodName)