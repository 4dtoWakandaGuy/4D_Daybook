//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImMin
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
	ARRAY TEXT:C222($_at_Text; 0)
	C_BOOLEAN:C305(<>RemOver)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_ArraySize; $_l_Index; $_l_TableNumber; $_l_Type; $5; $6)
	C_POINTER:C301($_ptr_Field; $1; $2; $3)
	C_TEXT:C284($_t_DC; $_t_DTR; $_t_oldMethodName; $_t_Remainder; $4; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFld; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImMin")

$_l_ArraySize:=$5+$6-1
ARRAY TEXT:C222($_at_Text; $_l_ArraySize)
For ($_l_Index; 1; $_l_ArraySize)
	$_at_Text{$_l_Index}:=""
End for 
$_t_DTR:="Start"
While (($_t_DTR#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_DTR:=Remote_Packet(vFld)
	If ($_t_DTR#"*END*")
		$_t_DC:=Remote_Packet(vFld)
		If (Length:C16($_t_DC)>1)
			QUERY:C277($1->; $2->=$_t_DC)
			If (Records in selection:C76($1->)=0)
				CREATE RECORD:C68($1->)
				$2->:=$_t_DC
				OK:=1
			Else 
				Remote_ImOverCh($3->)
				If ((OK=0) | ((DB_t_CurrentFormUsage2="Rem") & (<>RemOver=False:C215)))
					MESSAGE:C88("         Cannot overwrite "+$_t_DC+Char:C90(13))
					OK:=0
				End if 
			End if 
			If (OK=1)
				$3->:=$_t_DTR
				$_l_TableNumber:=Table:C252($1)
				For ($_l_Index; $5; ($5+$6-1))
					$_ptr_Field:=Field:C253($_l_TableNumber; $_l_Index)
					If (($_ptr_Field#$3) & ($_ptr_Field#$2))
						$_l_Type:=Type:C295($_ptr_Field->)
						If (($_l_Type#5) & ($_l_Type#3) & ($_l_Type#7))
							Case of 
								: (($_l_Type=1) | ($_l_Type=8) | ($_l_Type=9))
									$_ptr_Field->:=Num:C11(Remote_Rec)
								: ($_l_Type=4)
									$_ptr_Field->:=Date:C102(Remote_Rec)
								: ($_l_Type=6)
									$_ptr_Field->:=(Remote_Rec="1")
								: ($_l_Type=11)
									$_ptr_Field->:=Time:C179(Remote_Rec)
								Else 
									$_ptr_Field->:=Remote_Rec
							End case 
						End if 
					End if 
				End for 
				$_t_Remainder:=Remote_Packet(vRec)
				DB_SaveRecord($1)
			Else 
				$_t_Remainder:=Remote_Packet(vRec)
			End if 
		Else 
			$_t_Remainder:=Remote_Packet(vRec)
		End if 
	End if 
	If ($_t_Remainder="*END*@")
		$_t_DTR:="*END*"
	End if 
End while 
ERR_MethodTrackerReturn("Remote ImMin"; $_t_oldMethodName)
