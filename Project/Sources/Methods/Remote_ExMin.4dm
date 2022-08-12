//%attributes = {}
If (False:C215)
	//Project Method Name:      Remote_ExMin
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
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_Index; $_l_TableNumber; $_l_Type; $5; $6)
	C_POINTER:C301($_ptr_Field; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_ValueSTR; $4; vFld; vRec)
	C_TIME:C306(vDoc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote_ExMin")

If (<>SYS_l_CancelProcess#<>Process)
	QUERY:C277($1->; $3->>=[PERSONNEL:11]Last_Export:10; *)
	QUERY:C277($1->;  & ; $3-><":")
	If (Records in selection:C76($1->)>0)
		MESSAGE:C88("      "+String:C10(Records in selection:C76($1->))+" "+$4+Char:C90(13))
		SEND PACKET:C103(vDoc; "*FILE*"+vRec+$4+vRec+String:C10(Records in selection:C76($1->))+vRec)
		FIRST RECORD:C50($1->)
		While ((Not:C34(End selection:C36($1->))) & (<>SYS_l_CancelProcess#<>Process))
			SEND PACKET:C103(vDoc; $3->+vFld+$2->+vFld)
			$_l_TableNumber:=Table:C252($1)
			For ($_l_Index; $5; ($5+$6-1))
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_Index)
				If (($_ptr_Field#$3) & ($_ptr_Field#$2))
					$_l_Type:=Type:C295($_ptr_Field->)
					If (($_l_Type#5) & ($_l_Type#3) & ($_l_Type#7))
						Case of 
							: (($_l_Type=1) | ($_l_Type=4) | ($_l_Type=8) | ($_l_Type=9))
								$_t_ValueSTR:=String:C10($_ptr_Field->)
							: ($_l_Type=6)
								$_t_ValueSTR:=String:C10(Num:C11($_ptr_Field->))
							: ($_l_Type=11)
								$_t_ValueSTR:=Time string:C180($_ptr_Field->)
							Else 
								$_t_ValueSTR:=$_ptr_Field->
						End case 
						SEND PACKET:C103(vDoc; $_t_ValueSTR+vFld)
					End if 
				End if 
			End for 
			SEND PACKET:C103(vDoc; vRec)
			NEXT RECORD:C51($1->)
		End while 
		SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
	End if 
End if 
ERR_MethodTrackerReturn("Remote_ExMin"; $_t_oldMethodName)
