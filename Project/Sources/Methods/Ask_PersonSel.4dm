//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_PersonSel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305($_bo_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ask_PersonSel"; 0; GEN_at_Identity{GEN_at_Name})
//Ask_PersonSelect
If (GEN_at_Identity{GEN_at_Name}="^G@")
	
	If (GEN_at_Name<Size of array:C274(GEN_at_Name))
		If (GEN_at_Identity{GEN_at_Name+1}="^G@")
			//Insert
			Ask_PersonIns
		Else 
			//Delete
			$_bo_OK:=True:C214
			While ($_bo_OK)
				IDLE:C311  // 03/04/03 pb
				DELETE FROM ARRAY:C228(GEN_at_Name; GEN_at_Name+1; 1)
				DELETE FROM ARRAY:C228(GEN_at_RecordCode; GEN_at_Name+1; 1)
				DELETE FROM ARRAY:C228(GEN_at_Identity; GEN_at_Name+1; 1)
				If ((GEN_at_Name+1)<=Size of array:C274(GEN_at_Name))
					If (GEN_at_Identity{GEN_at_Name+1}="^G@")
						$_bo_OK:=False:C215
					End if 
				Else 
					$_bo_OK:=False:C215
				End if 
			End while 
		End if 
	Else 
		//Insert
		Ask_PersonIns
	End if 
	
End if 
ERR_MethodTrackerReturn("Ask_PersonSel"; $_t_oldMethodName)
